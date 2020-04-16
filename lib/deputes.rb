require 'nokogiri'
require 'open-uri'

liste = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

