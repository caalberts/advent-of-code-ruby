# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day04
      def initialize(input)
        @input = input
      end

      def part1
        assignment_pairs.count(&method(:redundant_assignment?))
      end

      def part2
        assignment_pairs.count(&method(:overlapping_assignment?))
      end

      private

      def overlapping_assignment?(assignments)
        assignment1, assignment2 = assignments

        assignment1.overlaps?(assignment2) && assignment2.overlaps?(assignment1)
      end

      def redundant_assignment?(assignments)
        assignment1, assignment2 = assignments

        assignment1.covers?(assignment2) || assignment2.covers?(assignment1)
      end

      Assignment = Struct.new(:from, :to) do
        def overlaps?(other)
          self.to >= other.from
        end

        def covers?(other)
          self.from <= other.from && self.to >= other.to
        end
      end

      def assignment_pairs
        @input.lines.map do |pair|
          pair.split(',').map { |elf| create_assignment(elf) }
        end
      end

      def create_assignment(elf)
        Assignment.new(*elf.split('-').map(&:to_i))
      end
    end
  end
end
