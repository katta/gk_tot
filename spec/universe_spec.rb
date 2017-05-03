require 'universe'
require 'kingdom'
require 'letter'

describe Universe do
  let(:space) { Kingdom.new('SPACE', 'Gorilla', 'Shan')}
  let(:land) { Kingdom.new('LAND', 'Panda') }
  let(:water) { Kingdom.new('WATER', 'Octopus') }
  let(:ice) { Kingdom.new('ICE', 'Mammoth') }
  let(:air) { Kingdom.new('AIR', 'Owl') }
  let(:fire) { Kingdom.new('FIRE', 'Dragon') }
  subject { universe = Universe.new([space, land, water, ice, air, fire]) }

  context 'should have no ruler' do
    it 'when no kindom has more than 3 allies' do
      expect(subject.ruler).to eq(nil)
    end
  end

  context 'should have a ruler' do
    it 'when kingdom has at least 3 allies' do
      subject.send(Letter.new('Space', 'Air', 'oaaawaala'))
      subject.send(Letter.new('Space', 'Land', 'a1d22n333a4444p'))
      subject.send(Letter.new('Space', 'Ice', 'zmzmzmzaztzozh'))

      expect(subject.ruler).to eq(space)
    end

    it 'when kingdom has more than 3 allies' do
      subject.send(Letter.new('Space', 'Air', "Let’s swing the sword together"))
      subject.send(Letter.new('Space', 'Land', 'Die or play the tame of thrones'))
      subject.send(Letter.new('Space', 'Ice', 'Ahoy! Fight for me with men and money'))
      subject.send(Letter.new('Space', 'Water', 'Summer is coming'))
      subject.send(Letter.new('Space', 'Fire', 'Drag on Martin!'))

      expect(subject.ruler).to eq(space)
    end
  end
end
