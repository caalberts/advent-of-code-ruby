# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day06 do
  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    using RSpec::Parameterized::TableSyntax

    where(:content, :result) do
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb' | 7
      'bvwbjplbgvbhsrlpgdmjqwftvncz' | 5
      'nppdvjthqldpwncqszvftbrmjlhg' | 6
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' | 10
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' | 11
    end

    with_them do
      it 'returns the number of characters that needs to be processed' do
        expect(subject.part1).to eq(result)
      end
    end
  end

  describe '#part2' do
    using RSpec::Parameterized::TableSyntax

    where(:content, :result) do
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb' | 19
      'bvwbjplbgvbhsrlpgdmjqwftvncz' | 23
      'nppdvjthqldpwncqszvftbrmjlhg' | 23
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' | 29
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' | 26
    end

    with_them do
      it 'returns the number of characters that needs to be processed' do
        expect(subject.part2).to eq(result)
      end
    end
  end
end
