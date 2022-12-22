# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day06
      def initialize(input)
        @input = input
      end

      def part1
        sequence_length = 4
        find_unique_sequence(sequence_length)
      end

      def part2
        sequence_length = 14
        find_unique_sequence(sequence_length)
      end

      private

      def find_unique_sequence(sequence_length)
        StringIO.new(signal).each_char.each_cons(sequence_length).with_index do |sequence, i|
          return i + sequence_length if sequence.uniq.length == sequence_length
        end
      end

      def signal
        @input.lines.first
      end
    end
  end
end
