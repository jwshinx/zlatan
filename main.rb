$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'

puts "---> zlatan.  welcome"

File.open('cities.xml') do |f|
 doc = REXML::Document.new(f)
 author = REXML::XPath.first(doc, '/document/author' )
 puts author.text
 
 REXML::XPath.each(doc, '/document/title' ) do |title|
  title.text = 'To Kill A Mockingbird (Classic)'
 end
 puts doc 
end

xr = XmlRipper.new
puts "---> 1. " + xr.to_s 

