require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::MIDIObjectCache do
  it 'can store and retrieve values' do 
    BW::MIDI::MIDIObjectCache[:foo] = :bar
    BW::MIDI::MIDIObjectCache[:foo].should == :bar
  end

  describe '.fetch' do
    it 'fetches values' do
      BW::MIDI::MIDIObjectCache.fetch(:foo).should == :bar
    end

    it 'raises KeyError for missing keys' do
      should.raise(KeyError) do
        BW::MIDI::MIDIObjectCache.fetch(:bar)
      end
    end
  end

  describe '.delete' do
    it 'can delete values' do
      BW::MIDI::MIDIObjectCache.delete(:foo)
      should.raise(KeyError) do
        BW::MIDI::MIDIObjectCache.fetch(:foo)
      end
    end
  end
end
