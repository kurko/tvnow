# encoding: utf-8
require 'open-uri'
require 'nokogiri'
require 'tvnow/show'

#require 'phantomjs'
#require 'watir-webdriver'
#require 'headless'

module Tvnow
  class Schedule
    def initialize(page)
      @page = page
    end

    def crawl
      #puts page.show_list_elements[:dom][:show_listing]
      #puts document

      shows = []
      if requires_javascript?
      #   puts "Javascript - #{page.show_list_elements[:dom][:show_listing]}"

      #   #headless = Headless.new
      #   #headless.start
      #   browser = Watir::Browser.new(:phantomjs)

      #   browser.goto(page.url)# our example
      #   #el = browser.elements(css: page.show_list_elements[:dom][:show_listing])
      #   el = browser.element(css: dom_rule[:show_title])
      #   puts el.inspect
      #   # el.each do |show|
      #   #   hey = {
      #   #     title: show.browser.element(css: dom_rule[:show_title]),
      #   #     time: show.browser.element(css: dom_rule[:show_time]),
      #   #   }

      #   #   puts hey.inspect
      #   # end
      #   #puts el.inspect
      #   #puts el.text

      #   browser.close
      #   #headless.destroy
      else
        shows = document.css(dom_rule[:show_listing]).map do |show|
          Show.new({title:       show.css(dom_rule[:show_title]).text,
                    subtitle:    show.css(dom_rule[:show_subtitle]).text,
                    time:        show.css(dom_rule[:show_time]).text,
                    date:        show.css(dom_rule[:show_date]).text,
                    description: show.css(dom_rule[:show_description]).text,
                    period:      show.css(dom_rule[:show_period]).text })
        end
      end
    end

    private

    attr_reader :page, :time

    def document
      @document ||= ::Nokogiri::HTML(open(page.url).read)
    end

    def requires_javascript?
      page.show_list_elements[:dom][:require_javascript]
    end

    def dom_rule
      page.show_list_elements[:dom]
    end
  end
end
