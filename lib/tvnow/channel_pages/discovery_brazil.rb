module Tvnow
  module ChannelPages
    class DiscoveryBrazil
      def initialize(time)
        @time = time
      end

      def url
        { today: "http://discoverybrasil.uol.com.br/tvl-fe/day/?type=day&channel_code=DCBR-PRT&style=brasil_day&date=#{Time.now.strftime("%d%m%Y")}" }[time]
      end

      def show_list_elements
        {
          dom: {
            # all elements are inside :show_listing
            #show_listing:     "#listings-results table",
            require_javascript: false,
            show_listing:       "tr.listing",
            show_time:          ".listing-datetime .listing-time",
            show_date:          ".listing-datetime .listing-date",
            show_title:         ".listings-programme .module.flip h3.module-title",
            show_subtitle:      ".listings-programme .module.flip .episode-title",
            show_description:   ".listings-programme .module.flip .module-content",
            # when the show starts and ends
            show_period:        ".listings-programme .module.flip .module-content.info .times"
          }
        }
      end

      private

      attr_reader :time
    end
  end
end
