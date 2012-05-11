class Resource < ActiveRecord::Base
  # rails g scaffold Resource title:string raw_url:string clean_url:string
  
  def self.convert_raw_to_clean_url(raw_url)
    clean_url = raw_url + "OOOOO"
    clean_url
  end

  def self.scrape_data(raw_url)
    p 'running Resource#self.scrape_data in Resource model'
        
    require 'nokogiri'
    require 'open-uri'
    require 'net/http'
    require 'pp'

    # dont need this because not instance variables anymore
    # attr_accessor(:title_scraped, :description_scraped, :keywords_scraped, :good_url)

    resource_scraped = {}

    begin
      resource_scraped[:raw_html] = Net::HTTP.get URI.parse(raw_url)
      p resource_scraped[:raw_html]
      p '55555555555555'
      resource_scraped[:html] = Nokogiri::HTML(open(raw_url))
      resource_scraped[:title_scraped] = resource_scraped[:html].css("title").length > 0 ? resource_scraped[:html].css("title").text : ""
      resource_scraped[:description_scraped] = resource_scraped[:html].css("meta[name='description']").length > 0 ? resource_scraped[:html].css("meta[name='description']").first.attributes['content'].value : ""
      resource_scraped[:keywords_scraped] = resource_scraped[:html].css("meta[name='keywords']").length > 0 ? resource_scraped[:html].css("meta[name='keywords']").first.attributes['content'].value : ""
      resource_scraped[:good_url] = true
    rescue Exception
      resource_scraped[:good_url] = false
    end
    resource_scraped
  end

end
