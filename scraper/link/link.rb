module TimeSeries
  class Link

    attr_reader :href, :uid, :url, :name, :xls, :frequency, :keyphrases

    def initialize(href)
      @href ||= href
      @uid ||= get_uid
      @name ||= get_name
      @url ||= get_url
      @xls ||= parse_xls
      @frequency ||= set_frequency
      @keyphrases ||= get_keyphrases
    end

    private

    def get_uid
      @href.attributes["href"].value.gsub("/statistics/tables/xls/", "").
          split("?").first.split(".").first[0..3].gsub("-", "").gsub("/", "").upcase
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

    def set_frequency
      if @name.downcase.include? "weekly"
        return "weekly".capitalize
      elsif @name.downcase.include? "daily"
        return "daily".capitalize
      else
        return "monthly".capitalize
      end
    end

    def get_keyphrases
      @href.parent.parent.previous_element.text.gsub("\t", "").gsub("\r", "").gsub("\n", "")
    end

    def parse_xls
      TimeSeries::Xls.new(@url)
    end

  end
end