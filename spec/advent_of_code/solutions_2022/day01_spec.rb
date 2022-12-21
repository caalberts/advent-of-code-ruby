# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day01 do
  let(:content) do
    <<~TXT
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the largest amount carried by an elf' do
      expect(subject.part1).to eq(24000)
    end
  end

  describe '#part2' do
    it 'returns the sum of the top 3 calories' do
      expect(subject.part2).to eq(45000)
    end
  end
end
