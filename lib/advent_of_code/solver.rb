# frozen_string_literal: true

module AdventOfCode
  class Solver
    attr_reader :year, :day, :part

    def initialize(year: Time.now.year, day: 1, part: 1)
      @year = year
      @day = day
      @part = part
    end

    def solve
      solution.public_send("part#{part}")
    rescue KeyError
      warn "Unimplemented problem for day #{day}"
    end

    private

    def solution
      solution_class = "Solutions%<year>d::Day%<day>02d" % { year: year, day: day }
      AdventOfCode.const_get(solution_class).new(input)
    end

    def verify_cookie
      Config.cookie || raise('Cookie required to authenticate with Advent of Code')
    end

    def input
      verify_cookie
      AdventOfCode::Input.new(year: year, day: day).fetch
    end
  end
end
