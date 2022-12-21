# frozen_string_literal: true

require 'faraday'

module AdventOfCode
  class Input
    attr_reader :year, :day

    URI = "https://adventofcode.com/%{year}/day/%{day}/input".freeze
    HEADERS = { 'Cookie' => "session=#{Config.cookie}" }.freeze

    def self.fetch(year: Time.now.year, day: 1)
      response = Faraday.get(URI % { year: year, day: day }, {}, HEADERS)

      new(response.body)
    end

    def initialize(content)
      @content = content
    end

    def lines
      content.each_line(chomp: true).lazy
    end

    private

    attr_reader :content
  end
end
