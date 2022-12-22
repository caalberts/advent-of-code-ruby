# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day05 do
  let(:content) do
    <<~TXT
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the top most item on each stack' do
      expect(subject.part1).to eq('CMZ')
    end
  end

  describe '#part2' do
    it 'returns the top most item on each stack' do
      expect(subject.part2).to eq('MCD')
    end
  end
end
