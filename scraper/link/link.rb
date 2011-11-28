module TimeSeries
  class Link

    attr_reader :href, :uid, :url, :name, :xls

    def initialize(href)
      @href = href
      @uid = get_uid
      @name = get_name
      @url = get_url
      @xls = parse_xls
    end

    private

    def get_uid
      @href.attributes["href"].value.gsub("/statistics/tables/xls/", "").
          split("?").first.split(".").first[0..3].gsub("-","").gsub("/","").upcase
    end

    def get_name
      name = @href.children.first.text.gsub("\t", "").gsub("\r", "").gsub("\n", "").split("-")
      name.pop
      name.join
    end

    def get_url
      url = @href.attributes["href"].value.split("?").first
      "http://www.rba.gov.au#{url}"
    end

    def parse_xls
      TimeSeries::Xls.new(@url)
    end

  end
end