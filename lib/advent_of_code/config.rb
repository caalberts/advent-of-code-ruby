# frozen_string_literal: true

module AdventOfCode
  class Config
    def self.cookie
      ENV['ADVENT_OF_CODE_COOKIE']
    end
  end
end
