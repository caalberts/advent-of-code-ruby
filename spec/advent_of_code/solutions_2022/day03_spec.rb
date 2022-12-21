# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day03 do
  let(:content) do
    <<~TXT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the total priority of items present in both compartments from all bags' do
      expect(subject.part1).to eq(157)
    end
  end

  describe '#part2' do
    it 'returns the total priority of the common item in all 3 bags in a group' do
      expect(subject.part2).to eq(70)
    end
  end
end
