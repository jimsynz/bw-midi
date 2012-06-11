require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::OutputPort do
  before do
    @client = BW::MIDI::Client.create('mock client')
    @port = @client.create_output_port('mock output port')
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

  it 'is an OutputPort' do
    @port.is_a?(BW::MIDI::OutputPort).should == true
  end

end
