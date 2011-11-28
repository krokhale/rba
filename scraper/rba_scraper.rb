module TimeSeries
  class RbaScraper

    attr_reader :url, :links

    def initialize
      @url ||= "http://www.rba.gov.au/statistics/tables/index.html"
      @links ||= []
    end

    def run!
      parse_xls_links
    end

    private

    def parse_xls_links
      lis = []
      doc = Nokogiri::HTML(open(@url))
      h4s = doc.search("//h4"); h4s.pop
      h4s.map { |h4| h4.next_element.children.map { |li| lis << li if li.name == "li" } }
      lis_with_xls = lis.select { |li| li.text.match("XLS") }
      lis_with_xls.map { |link| @links << TimeSeries::Link.new(link.children[1]) }
    end

  end
end