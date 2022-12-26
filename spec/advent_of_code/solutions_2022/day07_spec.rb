# frozen_string_literal: true

RSpec.describe AdventOfCode::Solutions2022::Day07 do
  let(:content) do
    <<~TXT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    TXT
  end

  let(:input) { AdventOfCode::Input.new(content) }

  subject { described_class.new(input) }

  describe '#part1' do
    it 'returns the sum of the total directories size where the directory size is at most 100,000' do
      expect(subject.part1).to eq(95437)
    end

    context 'when directory name is repeated' do
      let(:content) do
        <<~TXT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      dir e
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
      $ cd ..
      $ cd e
      $ ls
      1000 e.repeat
        TXT
      end

      it 'returns the sum of the total directories size where the directory size is at most 100,000' do
        expect(subject.part1).to eq(96437)
      end
    end
  end

  describe '#part2' do
      it 'returns the size of the smallest directory that can be deleted' do
        expect(subject.part2).to eq(24933642)
      end
  end
end
