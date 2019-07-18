require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

page = Nokogiri::HTML(open(PAGE_URL))   

def name_patch(page, i)
    name = page.xpath('//*[@class="link-secondary"]')[i].text
    return name
end

def price_patch(page, i)
    price = page.xpath('//*[@class="price"]')[i].text
    return price
end

def list_crypto(page)
    list_crypto = Array.new
    
    10.times do |i|
        list_crypto << {"#{name_patch(page, i)}": "#{price_patch(page, i)}"}
    end
    return list_crypto
end 

puts list_crypto(page)