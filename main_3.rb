$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'

xr = XmlRipper.new do 
 on_path( '/document/title' ) { |t| puts t.text } 
 on_path( '/document/author' ) { |a| puts a.text } 
end
xr.run( 'cities.xml' )

