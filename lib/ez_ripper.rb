class EzRipper

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
  tokens = statement.strip.split
  return if tokens.empty?

  case tokens.first
  when 'print'
   @r.on_path( tokens[1] ) { |e| puts e.text }
  when 'delete'
   @r.on_path( tokens[1] ) { |e| e.remove }
  when 'replace'
   @r.on_path( tokens[1] ) { |e| e.text = tokens[2] }
  when 'print_document'
   @r.after { |doc| puts doc }
  else
   raise "Unknown keyword: #{tokens.first}"
  end
 end

end
  
   
   
