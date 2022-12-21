# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day01
      def initialize(input)
        @input = input
      end

      def part1
        inventory.max_by(&:calories).calories
      end

      def part2
        inventory.sort_by(&:calories).reverse.first(3).sum(&:calories)
      end

      private

      Elf = Struct.new(:calories) do
        def add(calories)
          self.calories += calories
        end
      end

      def inventory
        [Elf.new(0)].tap do |elfs|
          @input.lines.each do |food|
            if food.empty?
              elfs << Elf.new(0)
            else
              elfs.last.add(food.to_i)
            end
          end
        end
      end
    end
  end
end
