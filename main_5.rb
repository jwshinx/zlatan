$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "rexml/document"
require 'xml_ripper'
require 'ez_regex_ripper'

raise %q(

           Error. Provide two arguments: <ripper file> <xml file>
           EG: change_nations.ezr cities.xml 
        ) if ARGV[0].nil? || ARGV[1].nil?

EzRegexRipper.new( 'change_nations.ezr' ).run( 'cities.xml' )
