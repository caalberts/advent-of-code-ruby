# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day02
      LOST = 0
      DRAW = 3
      WON = 6

      Move = Struct.new(:score) do
        def compare(other)
          score_diff = score - other.score

          case score_diff
          when 0 then return DRAW
          when 1, -2 then return WON
          when -1, 2 then return LOST
          end
        end
      end

      ROCK = Move.new(1)
      PAPER = Move.new(2)
      SCISSORS = Move.new(3)

      PART_1_PARSER = {
        'A' => ROCK,
        'B' => PAPER,
        'C' => SCISSORS,
        'X' => ROCK,
        'Y' => PAPER,
        'Z' => SCISSORS
      }

      class Round
        def initialize(left, right)
          @opp_move = PART_1_PARSER[left]
          @my_move = PART_1_PARSER[right]
        end

        def score
          @my_move.score + @my_move.compare(@opp_move)
        end
      end

      DESIRED_SCORE = {
        'X' => LOST,
        'Y' => DRAW,
        'Z' => WON
      }

      class DesiredResult
        def initialize(left, right)
          @opp_move = PART_1_PARSER[left]
          @desired_score = DESIRED_SCORE[right]
        end

        def score
          my_move.score + @desired_score
        end

        private

        def my_move
          [ROCK, PAPER, SCISSORS].find do |move|
            move.compare(@opp_move) == @desired_score
          end
        end
      end


      def initialize(input)
        @input = input
      end

      def part1
        lines.map { |line| Round.new(*line.split(" ")) }.sum(&:score)
      end

      def part2
        lines.map { |line| DesiredResult.new(*line.split(" "))}.sum(&:score)
      end

      private

      def lines
        @input.split("\n")
      end
    end
  end
end
