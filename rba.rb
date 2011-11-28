$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'scraper/rba_scraper'
require 'scraper/link/link'
require 'scraper/xls/xls'

module TimeSeries

  class Rba

    attr_reader :url, :links

    def initialize
    end

    def scrape!
      scraper = TimeSeries::RbaScraper.new
      scraper.run!
      @links = scraper.links
      @url = scraper.url
      nil
    end

  end

end


