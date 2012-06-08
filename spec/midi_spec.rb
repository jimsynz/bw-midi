if respond_to?(:require)
  require File.expand_path('../spec_helper', __FILE__)
end

describe BubbleWrap::MIDI do

  describe '.devices' do
    it 'returns an Enumerable' do
      BW::MIDI.devices.is_a?(Enumerable).should == true
    end

    it 'contains at least one element' do
      BW::MIDI.devices.any?.should == true
    end

    describe '.devices.first' do
      before do
        @device = BW::MIDI.devices.first
      end

      it 'has a device id' do
        @device.id.should >= 0
      end

      it 'has a midi object reference' do
        @device.midi_ref.should >= 0
      end
    end
  end

  describe '.sources' do
  end

  describe '.destinations' do
  end

end
