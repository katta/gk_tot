require 'kingdom'

describe Kingdom do
  let(:water) { Kingdom.new('WATER', 'Octopus') }
  let(:ice) { Kingdom.new('ICE', 'Mammoth') }
  subject { Kingdom.new('LAND', 'Panda') }

  context 'should accept ally' do
    it 'when emblum is found in message' do
      subject.send(ice, 'a1d22n333a4444P')
      expect(subject.allies).to include(ice)
    end

    it 'when emblum is found in message irrespective of case' do
      subject.send(ice, 'a1d22n333a4444p')
      expect(subject.allies).to include(ice)
    end
  end

  context 'should not accept ally' do
    it 'when emblum is not found in message' do
      subject.send(ice, 'a1d22n3334444P')
      expect(subject.allies).not_to include(ice)
    end

    it 'when emblum is not found in message irrespective of case' do
      subject.send(ice, 'a1d22n3334444p')
      expect(subject.allies).not_to include(ice)
    end

    it 'when message is empty' do
      subject.send(ice, '')
      expect(subject.allies).not_to include(ice)
    end

    it 'when message is nil' do
      subject.send(ice, nil)
      expect(subject.allies).not_to include(ice)
    end
  end
end
