# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day02 do
  let(:content) do
    <<~TXT
      A Y
      B X
      C Z
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the total score' do
      expect(subject.part1).to eq(15)
    end
  end

  describe '#part2' do
    it 'returns the total score' do
      expect(subject.part2).to eq(12)
    end
  end
end
