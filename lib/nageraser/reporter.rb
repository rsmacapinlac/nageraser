require 'rescuetime'
require 'dotenv'

module Nageraser
  class Reporter
    attr_accessor :_rr_client
    attr_accessor :start_range, :end_range

    def initialize(api_key = nil, options = {})
      _api_key = load_key(api_key)
      @_rr_client = Rescuetime::Client.new(api_key: _api_key)
      # puts "api_key? #{@_rr_client.api_key?}"
      # puts "valid_credentials? #{@_rr_client.valid_credentials?}"
    end

    def report_month(month, year)
      range_end_year  = year.to_i
      range_end_month = month.to_i + 1
      if range_end_month == 12
        range_end_year = range_end_year + 1
        range_end_month = 01
      end

      range_start = Time.new(year, month, '01')
      range_end   = Time.new(range_end_year, range_end_month, '01') - (60*60*24)

      puts "range_start #{range_start}"
      puts "range_end   #{range_end}"

      @_rr_client.activities.from(range_start).to(range_end).order_by(:time, interval: :day)
    end

    def report_today
      @_rr_client.activities.date(Time.now)
    end

    private

    def load_key(api_key = nil)
      o = api_key
      if api_key.nil?
        Dotenv.load
        o = ENV['RESCUE_TIME_KEY']
      end
      return o
    end
  end
end
