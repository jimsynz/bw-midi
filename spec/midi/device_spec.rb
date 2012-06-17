require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::Device do
  before do
    @midi = BW::MIDI.devices.first
  end

  describe "#entities" do
    it 'returns an Enumerable' do
      @midi.entities.is_a?(Enumerable).should == true
    end

    describe '.first' do
      it 'returns an Entity' do
        @midi.entities.first.is_a?(BubbleWrap::MIDI::Entity).should == true
      end
    end
  end

end
