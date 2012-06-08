require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::MIDIObject do
  before do
    @midi = BW::MIDI.devices.first
  end

  describe '.properties' do
    it 'returns a hash' do
      @midi.properties.is_a?(Hash).should == true
    end
  end
end
