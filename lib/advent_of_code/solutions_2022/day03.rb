# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day03
      PRIORITY = ([0] + ('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.to_h

      GroupBags = Struct.new(:bags) do
        def compartments
          return to_enum(__method__) unless block_given?

          bags.each do |bag|
            yield bag
          end
        end
      end

      Bag = Struct.new(:content) do
        def compartments
          return to_enum(__method__) unless block_given?

          compartment_size = content.length / 2

          compartment_1 = Compartment.new(content[0..compartment_size-1])
          compartment_2 = Compartment.new(content[compartment_size..-1])

          [compartment_1, compartment_2].each { |comp| yield comp }
        end

        def items
          return to_enum(__method__) unless block_given?

          content.split('').each do |item|
            yield item
          end
        end
      end

      Compartment = Struct.new(:content) do
        def items
          return to_enum(__method__) unless block_given?

          content.split('').each do |item|
            yield item
          end
        end
      end

      class Collector
        attr_reader :total

        def initialize(minimum_occurence)
          @minimum_occurence = minimum_occurence
          @total = 0
          @seen = Array.new(PRIORITY['Z'] + 1, 0)
        end

        def track(item)
          item_priority = PRIORITY[item]
          @seen[item_priority] += 1
        end

        def check(item)
          @total += PRIORITY[item] if seen?(item)
        end

        def seen?(item)
          @seen[PRIORITY[item]] >= @minimum_occurence
        end
      end

      def initialize(input)
        @input = input
      end

      def part1
        bags.inject(0) do |total, bag|
          total + priorities_in_collection(bag, 2)
        end
      end

      def part2
        bags.each_slice(3).inject(0) do |total, bags|
          group_bag = GroupBags.new(bags)
          total + priorities_in_collection(group_bag, 3)
        end
      end

      private

      def bags
        @input.lines.map do |line|
          Bag.new(line)
        end
      end

      def priorities_in_collection(collection, num_partitions)
        collector = Collector.new(num_partitions - 1)

        collection.compartments.with_index.each_with_object(collector) do |(compartment, i), collector|
          compartment.items.uniq.each do |item|
            if i < num_partitions - 1
              collector.track(item)
            else
              collector.check(item)
            end
          end
        end

        collector.total
      end
    end
  end
end
