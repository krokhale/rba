module TimeSeries
  class Scraper

    def initialize
       @url = "www.rba.gov.au/statistics/tables"
    end

    def run!
      get_xls_files
      parse_xls_files
    end

    private

    def get_xls_files


    end

    def parse_xls_files

    end

  end
end