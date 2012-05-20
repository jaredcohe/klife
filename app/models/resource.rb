class Resource < ActiveRecord::Base
  # rails g scaffold Resource title:string raw_url:string clean_url:string
  
  has_many :collectionizes
  has_many :collections, :through => :collectionizes
  
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

    resource_scraped = {}

    begin
      resource_scraped[:raw_html] = Net::HTTP.get URI.parse(raw_url)
      resource_scraped[:html] = Nokogiri::HTML(open(raw_url))
      resource_scraped[:title_scraped] = resource_scraped[:html].css("title").length > 0 ? resource_scraped[:html].css("title").text : nil
      if resource_scraped[:html].css("meta[name='description']").length > 0
        if resource_scraped[:html].css("meta[name='description']").first.attributes['content']
          resource_scraped[:description_scraped] = resource_scraped[:html].css("meta[name='description']").first.attributes['content'].value
        elsif resource_scraped[:html].css("meta[name='description']").first.attributes['contents']
          resource_scraped[:description_scraped] = resource_scraped[:html].css("meta[name='description']").first.attributes['contents'].value
        else
          resource_scraped[:description_scraped] = nil
        end
      end

      if resource_scraped[:html].css("meta[name='keywords']").length > 0
        if resource_scraped[:html].css("meta[name='keywords']").first.attributes['content']
          resource_scraped[:keywords_scraped] = resource_scraped[:html].css("meta[name='keywords']").first.attributes['content'].value
        elsif resource_scraped[:html].css("meta[name='keywords']").first.attributes['contents']
          resource_scraped[:keywords_scraped] = resource_scraped[:html].css("meta[name='keywords']").first.attributes['contents'].value
        else
          resource_scraped[:keywords_scraped] = nil
        end
      end

      # resource_scraped[:keywords_scraped] = resource_scraped[:html].css("meta[name='keywords']").length > 0 ? resource_scraped[:html].css("meta[name='keywords']").first.attributes['content'].value : ""
      resource_scraped[:good_url] = true
    rescue Exception
      resource_scraped[:good_url] = false
    end
    resource_scraped
  end

end
