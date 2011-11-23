$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'scraper/scraper'

module TimeSeries

  class Rba

    def initialize
    end

    def scrape!
      scraper = TimeSeries::Scraper.new
      scraper.run!
    end

  end

end


