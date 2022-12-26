# frozen_string_literal: true

require_relative './advent_of_code/config'
require_relative './advent_of_code/input'
require_relative './advent_of_code/solver'
require_relative './advent_of_code/version'

require_relative './advent_of_code/solutions_2022/day01'
require_relative './advent_of_code/solutions_2022/day02'
require_relative './advent_of_code/solutions_2022/day03'
require_relative './advent_of_code/solutions_2022/day04'
require_relative './advent_of_code/solutions_2022/day05'
require_relative './advent_of_code/solutions_2022/day06'
require_relative './advent_of_code/solutions_2022/day07'

module AdventOfCode
  class Error < StandardError; end
  # Your code goes here...
end
