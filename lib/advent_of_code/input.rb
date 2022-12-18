# frozen_string_literal: true

require 'faraday'

module AdventOfCode
  class Input
    attr_reader :year, :day

    def initialize(year: Time.now.year, day: 1)
      @year = year
      @day = day
    end

    def fetch
      response = Faraday.get(uri, {}, headers)
      response.body
    end

    private

    def uri
      "https://adventofcode.com/#{year}/day/#{day}/input"
    end

    def headers
      { 'Cookie' => "session=#{Config.cookie}" }
    end
  end
end
