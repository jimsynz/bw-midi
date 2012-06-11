require File.expand_path('../../spec_helper', __FILE__) if respond_to?(:require)

describe BubbleWrap::MIDI::Client do
  before do
    @client = BubbleWrap::MIDI::Client.create('mock client')
  end

  it 'has a midi_id' do
    @client.midi_id.nil?.should == false
  end

  describe '#properties' do
    it 'is a Hash' do
      @client.properties.is_a?(Hash).should == true
    end
  end

end
