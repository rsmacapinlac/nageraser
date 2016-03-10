require 'yaml'

module Nageraser
  class Formatter
    attr_accessor :_data, :_data_count, :_unaccounted_activities
    attr_accessor :_job, :config_data

    def initialize(data, job)
      @_data = data
      @_data_count = {}
      @_job = job

      @_unaccounted_activities = []

      init_config_file
      # puts @config_data[job]

    end

    def find(activity, activities_by_category)
      output = nil
      activities_by_category.keys.each do |category|
        if activities_by_category[category].include?(activity)
          output = category
        end
      end
      return output
    end

    def count
      @_data.each do |activity|
        d = Date.parse(activity[:date]).to_s
        @_data_count[d] = init_category_counts(@config_data[@_job]) if @_data_count[d].nil?
        cat = find activity[:activity], @config_data[@_job]
        if !cat.nil?
          # puts "#{d}: #{activity[:activity]} #{cat} - #{activity[:time_spent_seconds]}"
          @_data_count[d][cat] = @_data_count[d][cat] + activity[:time_spent_seconds].to_i
        else
          @_unaccounted_activities << activity
        end
      end

      # convert seconds spent to hourly
      @_data_count.keys.each do |_date|
        @_data_count[_date].keys.each do |_role|
          seconds_spent = @_data_count[_date][_role]
          @_data_count[_date][_role] = ((seconds_spent / 60).to_f / 60).to_f
        end
      end

    end

    def format
      @_data_count.keys.each do |_date|
        puts "#{_date}: #{@_data_count[_date]}"
      end
    end

    def count_and_format
      count
      format
    end

    private

    def init_category_counts(categories)
      o = {}
      categories.keys.each do |category|
        o[category] = 0
      end
      return o
    end

    def init_config_file
      @config_data = YAML.load_file('ritchie.yml')
    end
  end
end
