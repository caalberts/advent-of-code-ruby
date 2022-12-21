# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day04 do
  let(:content) do
    <<~TXT
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the number of pairs where there is a full overlap' do
      expect(subject.part1).to eq(2)
    end
  end

  describe '#part2' do
    it 'returns the number of pairs where there is some overlap' do
      expect(subject.part2).to eq(4)
    end
  end
end
