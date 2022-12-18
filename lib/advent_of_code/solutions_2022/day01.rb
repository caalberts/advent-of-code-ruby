# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day01
      def initialize(input)
        @input = input
      end

      def part1
        inventory.max
      end

      def part2
        inventory.sort.reverse.first(3).sum
      end

      private

      def inventory
        @input.split("\n\n").map { |elf| elf.split("\n").map(&:to_i).sum }
      end
    end
  end
end
