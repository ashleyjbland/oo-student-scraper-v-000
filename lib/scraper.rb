require 'open-uri'
require 'pry'
require 'nokogiri'


class Scraper

  def self.scrape_index_page(index_url)
    index_html = Nokogiri::HTML(open(index_url))
    student_info = index_html.css(".student-card")
    students = []
    student_info.collect do |student_info_xml|
      students << {
       :name => student_info_xml.css("h4.student-name").text,
       :location => student_info_xml.css("p.student-location").text,
       :profile_url => student_info_xml.css("a").attribute("href").value
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile_html = Nokogiri::HTML(open(profile_url))
    student = {}

    #student[:blog]= profile_html.css
    #student[:github]= profile_html.css
    #student[:linkedin]= profile_html.css
    #student[:twitter]= profile_html.css
    student[:profile_quote]= profile_html.css("div.profile-quote").text.strip
    student[:bio]= profile_html.css("div.bio-content div.description-holder").text.strip
    profile_html.css("div.social-icon-container a").each do |k, v|
   end


  end

end
