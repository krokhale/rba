$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'scraper/rba_scraper'
require 'scraper/link/link'
require 'scraper/xls/xls'

module TimeSeries

  class Rba

    def initialize

    end

    def scrape!
      scraper = TimeSeries::RbaScraper.new
      scraper.run!
      @links = scraper.links
    end

  end

end


