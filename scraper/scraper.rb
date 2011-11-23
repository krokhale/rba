module TimeSeries
  class Scraper

    def initialize
       @url ||= "www.rba.gov.au/statistics/tables"
    end

    def run!
      parse_xls_links
      parse_xls_files
    end

    private

    def parse_xls_links
      spans, links = [], []
      doc = Nokogiri::HTML(open(@url))
      doc.search("//span").map {|span| spans << span if span.text == "[XLS]"}
      #spans.map {|span| }
    end

    def parse_xls_files

    end

  end
end