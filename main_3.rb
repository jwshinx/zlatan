$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'

raise %q(

           Error. Provide two arguments: <ripper file> <xml file>
           EG: fix_cities.ripper cities.xml 
        ) if ARGV[0].nil? || ARGV[1].nil?

xr = XmlRipper.new
xr.initialize_from_file( ARGV[0] )
xr.run( ARGV[1] )


