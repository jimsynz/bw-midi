require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::InputPort do
  before do
    @client = BW::MIDI::Client.create('mock client')
    @port = @client.create_input_port('mock input port')
  end

  after do
    @port.destroy
  end

  it 'has a midi_id' do
    @port.midi_id.nil?.should == false
  end

  it 'is a MIDIObject' do
    @port.is_a?(BW::MIDI::MIDIObject).should == true
  end

  it 'is an InputPort' do
    @port.is_a?(BW::MIDI::InputPort).should == true
  end

end
