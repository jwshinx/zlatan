$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'

xr = XmlRipper.new
xr.initialize_from_file( 'fix_cities.ripper' )
xr.run( 'cities.xml' )
