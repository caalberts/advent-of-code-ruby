# frozen_string_literal: true

module AdventOfCode
  module Solutions2022
    class Day07
      class FileSystem
        UP = '..'

        def initialize
          @directories =  Hash.new {|h, k| h[k] = 0 }
          @stack = []
        end

        def cd(dir)
          case dir
          when UP then @stack.pop
          else @stack.push dir
          end
        end

        def directories
          return to_enum(__method__) unless block_given?

          @directories.each { |entry| yield entry }
        end

        def add_dir(dir)
        end

        def add_file(file, size)
          @stack.each_with_index do |_, i|
            path = @stack[0..i].join('/')
            @directories[path] += size
          end
        end

        def current_dir
          @stack.last
        end
      end

      def initialize(input)
        @input = input
      end

      class Interpreters
        def self.interpret(string)
          interpreter = [
            CommandCd,
            CommandLs,
            LsEntryDir,
            LsEntryFile
          ].find { |cmd| cmd::PATTERN.match?(string) }
          interpreter.new(string)
        end
      end

      class CommandCd
        PATTERN = %r{\$ cd (.+)}

        def initialize(string)
          @dir = string.scan(PATTERN)[0].first
        end

        def apply(file_system)
          file_system.cd(@dir)
        end
      end

      class CommandLs
        PATTERN = %r{\$ ls}

        def initialize(string)
        end

        def apply(file_system)
        end
      end

      class LsEntryDir
        PATTERN = %r{dir ([a-z]+)}

        def initialize(string)
          @name = string.scan(PATTERN)[0].first
        end

        def apply(file_system)
          file_system.add_dir(@name)
        end
      end

      class LsEntryFile
        PATTERN = %r{(\d+) ([a-z.]+)}

        def initialize(string)
          match = string.scan(PATTERN)[0]
          @size = match[0].to_i
          @name = match[1]
        end

        def apply(file_system)
          file_system.add_file(@name, @size)
        end
      end

      DISK_SIZE = 70_000_000
      UPDATE_SIZE = 30_000_000

      def part1
        file_system.directories.sum { |_, size| size <= 100000 ? size : 0 }
      end

      def part2
        _root, total_size = file_system.directories.find { |path, size| path == '/' }
        empty_space = DISK_SIZE - total_size
        required_size = UPDATE_SIZE - empty_space

        possible_dirs = file_system.directories.select { |_, size| size >= required_size }
        _, size = possible_dirs.min_by { |_, size| size }
        size
      end

      private

      def file_system
        @fs ||= FileSystem.new.tap do |fs|
          build_tree(fs)
        end
      end

      def build_tree(fs)
        @input.lines.each_with_object(fs) do |line, fs|
          interpret_line(line, fs)
        end
      end

      def interpret_line(line, fs)
        Interpreters.interpret(line).apply(fs)
      end
    end
  end
end
