require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def target_name(page)
  crypto_name = []
  page.css("tr//td[2]//a.cmc-link").each do |name|
    crypto_name << name.text
  end
  return crypto_name
end

def target_price(page)
  crypto_trend = []
  page.css("tr//td[5]//a.cmc-link").each do |price|
    crypto_trend << price.text
  end
  return crypto_trend
end

def perform
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  hash = Hash[target_name(page).zip(target_price(page))]
  for name in hash.keys 
    puts "#{name} : #{hash[name]}."
  end
end

perform