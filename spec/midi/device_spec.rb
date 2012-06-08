require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::Device do
  before do
    @midi = BW::MIDI.devices.first
  end

  describe '#offline' do
    describe "properties['offline'] = 1" do
      it 'returns true' do
        @midi.properties = {'offline' => 1}
        @midi.offline.should == true
      end
    end

    describe "properties['offline'] = 0" do
      it 'returns false' do
        @midi.properties = {'offline' => 0}
        @midi.offline.should == false
      end
    end
  end

  describe "#online" do
    describe "properties['offline'] = 1" do
      it 'returns the opposite of #offline' do
        @midi.properties = {'offline' => 1}
        @midi.online.should == !@midi.offline
      end
    end

    describe "properties['offline'] = 0" do
      it 'returns the opposite of #offline' do
        @midi.properties = {'offline' => 0}
        @midi.online.should == !@midi.offline
      end
    end
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
