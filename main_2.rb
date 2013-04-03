$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'


File.open('cities.xml') do |f|
 doc = REXML::Document.new(f)
 author = REXML::XPath.first(doc, '/document/author' )
 puts author.text
 
 REXML::XPath.each(doc, '/document/title' ) do |title|
  title.text = 'To Kill A Mockingbird (Classic)'
 end
 puts doc 
end

xr = XmlRipper.new do |r|
 r.on_path( '/document/title' ) { |t| puts t.text } 
 r.on_path( '/document/author' ) { |a| puts a.text } 
end
xr.run( 'cities.xml' )

