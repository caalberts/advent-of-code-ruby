# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day05
      def initialize(input)
        @input = input
      end

      def part1
        execute(Move)
      end

      def part2
        execute(MoveGroup)
      end

      private

      def execute(move_class)
        parser = Parser.new(@input, move_class)
        stacks = parser.parse_stack_lines
        moves = parser.parse_move_lines

        moves.each do |move|
          move.execute(stacks)
        end

        stacks.top_most_items.join('')
      end

      class Stacks
        def initialize
          @stacks = []
        end

        def prepend_to_ith_stack(item, i)
          @stacks << [] if @stacks.length == i

          @stacks[i].unshift(item) if !item.strip.empty?
        end

        def push_to_nth_stack(item, n)
          @stacks[n-1].push(item)
        end

        def pop_from_nth_stack(n)
          @stacks[n-1].pop
        end

        def top_most_items
          @stacks.map(&:last)
        end
      end

      class Move
        def initialize(line)
          parsed = line.scan(%r{\d+})
          @amount = parsed[0].to_i
          @from = parsed[1].to_i
          @to = parsed[2].to_i
        end

        def execute(stacks)
          @amount.times do
            item = stacks.pop_from_nth_stack(@from)
            stacks.push_to_nth_stack(item, @to)
          end
        end
      end

      class MoveGroup
        def initialize(line)
          parsed = line.scan(%r{\d+})
          @amount = parsed[0].to_i
          @from = parsed[1].to_i
          @to = parsed[2].to_i
        end

        def execute(stacks)
          buffer = []
          @amount.times do
            item = stacks.pop_from_nth_stack(@from)
            buffer.unshift(item)
          end

          buffer.each do |item|
            stacks.push_to_nth_stack(item, @to)
          end
        end
      end

      class Parser
        def initialize(input, move_class)
          @stack_lines, @move_lines = input.lines.slice_before do |line|
            line.empty?
          end.to_a
          @move_class = move_class
        end

        def parse_stack_lines
          stacks = Stacks.new

          @stack_lines.each do |line|
            items = line.scan(%r{    |[A-Z]})

            items.each_with_index do |item, i|
              stacks.prepend_to_ith_stack(item, i)
            end
          end

          stacks
        end

        def parse_move_lines
          @move_lines[1..-1].map do |line|
            @move_class.new(line)
          end
        end
      end
    end
  end
end
