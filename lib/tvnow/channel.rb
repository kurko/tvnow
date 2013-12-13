require "tvnow/schedule"

module Tvnow
  class Channel
    def initialize(channel_name, country = :brazil)
      @channel_name = channel_name
      @country = country
    end

    def schedule(time = :today)
      Schedule.new(channel_page(time)).crawl
    end

    private

    attr_reader :channel_name, :country

    def channels_dictionary
      current = "#{channel_name}_#{country}".to_sym

      { discovery_brazil: "DiscoveryBrazil" }[current]
    end

    def channel_page(time)
      Module.const_get("Tvnow::ChannelPages::#{channels_dictionary}").new(time)
    end
  end
end
