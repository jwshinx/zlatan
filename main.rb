require "rexml/document"
puts "---> zlatan.  welcome"

File.open('cities.xml') do |f|
 doc = REXML::Document.new(f)
 author = REXML::XPath.first(doc, '/document/author' )
 puts author.text
end

