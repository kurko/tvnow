module Tvnow
  class Show
    def initialize(options)
      @options = options
    end

    def title
      options[:title]
    end

    def subtitle
      options[:subtitle]
    end

    def time
      options[:time]
    end

    def date
      options[:date]
    end

    def description
      options[:description]
    end

    def period
      options[:period]
    end

    private

    attr_reader :options
  end
end
