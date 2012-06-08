require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::Entity do
  before do
    @entity = BubbleWrap::MIDI.devices.first.entities.first
  end

  it 'has an midi_id' do
    @entity.midi_id.nil?.should == false
  end

  describe '.properties' do
    it 'is a Hash' do
      @entity.properties.is_a?(Hash).should == true
    end
  end

  describe '.device' do
    it 'is a Device' do
      @entity.device.is_a?(BubbleWrap::MIDI::Device).should == true
    end

    it 'is parent device' do
      @entity.device.should == BubbleWrap::MIDI.devices.first
    end
  end

  describe '.destinations' do
    it 'is Enumerable' do
      @entity.destinations.is_a?(Enumerable).should == true
    end

    describe '.first' do
      before do 
        @dest = @entity.destinations.first
      end

      it 'is a Destination' do
        @dest.is_a?(BW::MIDI::Destination).should == true
      end
    end
  end

  describe '.sources' do
    it 'is Enumerable' do
      @entity.sources.is_a?(Enumerable).should == true
    end

    describe '.first' do
      before do 
        @dest = @entity.sources.first
      end

      it 'is a Destination' do
        @dest.is_a?(BW::MIDI::Source).should == true
      end
    end
  end

end
