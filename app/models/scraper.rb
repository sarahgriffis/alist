require 'nokogiri'
require 'open-uri'


0.upto(20) do |num|
  start = 1 + 50*num
  page_url = "http://www.imdb.com/search/name?gender=male,female&start=#{start}"
  page = Nokogiri::HTML(open(page_url))
  td = page.css("td[class='name']")

  td.each do |elem|
   puts elem.css('a').first.text
  end

end
