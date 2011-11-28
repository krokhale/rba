module TimeSeries
  class Link

    def initialize(href)
      @href = href
      @uid = get_uid
      @name = get_name
      @url = get_url
      @xls = parse_xls
    end

    private

    def get_uid
      @href..attributes["href"].value.gsub("/statistics/tables/xls/", "").
          split("?").first.split(".").first[0..3].gsub("-","").gsub("/","").upcase
    end

    def get_name

    end

    def get_url

    end

    def parse_xls
      Xls.new(@url)
    end

  end
end