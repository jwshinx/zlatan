class EzRegexRipper

 def initialize( program_path )
  @r = XmlRipper.new
  parse_program( program_path )
 end

 def run( xml_file )
  @r.run( xml_file )
 end

 def parse_program( program_path )
  File.open( program_path ) do |f|
   until f.eof?
    parse_statement( f.readline )
   end
  end
 end

 def parse_statement( statement )
  statement = statement.sub( /#.*/, '' )
  case statement.strip

  when ''
   # dont do anything 

  when /print\s+'(.*?)'/
   @r.on_path( $1 ) { |e| puts e.text }

  when /delete\s+'(.*?)'/
   @r.on_path( $1 ) { |e| e.remove }

  when /replace\s+'(.*?)'\s+'(.*?)'$/
   @r.on_path( $1 ) { |e| e.text = $2 }

  when /uppercase\s+'(.*?)'/
   @r.on_path( $1 ) { |e| e.text = e.text.upcase }

  when 'print_document'
   @r.after { |doc| puts doc }

  else
   raise "Unknown: #{statement}"
  end
 end

end
  
   
   
