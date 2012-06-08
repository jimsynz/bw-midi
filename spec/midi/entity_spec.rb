require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::Entity do
  before do
    @entity = BubbleWrap::MIDI.devices.first.entities.first
  end

  it 'has a midi_ref' do
    @entity.midi_ref.nil?.should == false
  end

  it 'has properties' do
    @entity.properties
    true.should == true
  end

end
