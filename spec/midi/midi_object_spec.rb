require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::MIDIObject do
  before do
    @midi = BW::MIDI.devices.first
    @prop = @midi.properties.keys.last.to_s.underscore.to_sym
  end

  describe '.at' do
    it 'caches instance_cache' do
      @midi.should == BW::MIDI.devices.first
    end
  end

  describe "#id" do
    it 'has an id' do
      @midi.midi_id.should.not == nil
    end
  end

  describe '#properties' do
    it 'returns a hash' do
      @midi.properties.is_a?(Hash).should == true
    end
  end

  describe "#respond_to?" do
    it 'makes fake respond_tos for properties' do
      @midi.respond_to?(@prop).should == true
    end
  end

  describe '#method_missing' do
    it 'makes fake methods for properties' do
      should.not.raise(NoMethodError) do
        @midi.send(@prop)
      end
    end
  end

  describe '#unique_id=' do
    it 'can be set' do
      @uid = rand(0xffff)
      @midi.unique_id = @uid
      @midi.unique_id.should == @uid
    end
  end

  describe '#destroy' do
    it 'removes itself from the instance cache' do
      midi_id = @midi.midi_id
      @midi.destroy
      should.raise(KeyError) do
        BW::MIDI::MIDIObjectCache.fetch(midi_id)
      end
    end
  end
end
