if respond_to?(:require)
  require File.expand_path('../spec_helper', __FILE__)
end

describe BubbleWrap::MIDI do

  describe '.devices' do
    it 'returns an Enumerable' do
      BW::MIDI.devices.is_a?(Enumerable).should == true
    end

    it 'contains at least one element' do
      BW::MIDI.devices.any?.should == true
    end

    describe '.devices.first' do
      before do
        @device = BW::MIDI.devices.first
      end

      it 'has a device id' do
        @device.midi_id.should >= 0
      end
    end
  end

  describe '.sources' do
  end

  describe '.destinations' do
  end

  describe '.status' do
    it 'returns true if OSStatus is 0' do
      BW::MIDI.status{ 0 }.should == true
    end

    it 'raises InvalidClient' do
      should.raise(BW::MIDI::MIDIException::InvalidClient) do
        BW::MIDI.status() { KMIDIInvalidClient }
      end
    end

    it 'raises InvalidPort' do
      should.raise(BW::MIDI::MIDIException::InvalidPort) do
        BW::MIDI.status() { KMIDIInvalidPort }
      end
    end

    it 'raises WrongEndpointType' do
      should.raise(BW::MIDI::MIDIException::WrongEndpointType) do
        BW::MIDI.status() { KMIDIWrongEndpointType }
      end
    end

    it 'raises NonExistantConnection' do
      should.raise(BW::MIDI::MIDIException::NonExistantConnection) do
        BW::MIDI.status() { KMIDINoConnection }
      end
    end

    it 'raises UnknownEndpoint' do
      should.raise(BW::MIDI::MIDIException::UnknownEndpoint) do
        BW::MIDI.status() { KMIDIUnknownEndpoint }
      end
    end

    it 'raises UnknownProperty' do
      should.raise(BW::MIDI::MIDIException::UnknownProperty) do
        BW::MIDI.status() { KMIDIUnknownProperty }
      end
    end

    it 'raises WrongPropertyType' do
      should.raise(BW::MIDI::MIDIException::WrongPropertyType) do
        BW::MIDI.status() { KMIDIWrongPropertyType }
      end
    end

    it 'raises NoCurrentSetup' do
      should.raise(BW::MIDI::MIDIException::NoCurrentSetup) do
        BW::MIDI.status() { KMIDINoCurrentSetup }
      end
    end

    it 'raises MessageSendError' do
      should.raise(BW::MIDI::MIDIException::MessageSendError) do
        BW::MIDI.status() { KMIDIMessageSendErr }
      end
    end

    it 'raises ServerStartError' do
      should.raise(BW::MIDI::MIDIException::ServerStartError) do
        BW::MIDI.status() { KMIDIServerStartErr }
      end
    end
   
    it 'raises SetupFormatError' do
      should.raise(BW::MIDI::MIDIException::SetupFormatError) do
        BW::MIDI.status() { KMIDISetupFormatErr }
      end
    end
   
    it 'raises WrongThread' do
      should.raise(BW::MIDI::MIDIException::WrongThread) do
        BW::MIDI.status() { KMIDIWrongThread }
      end
    end
   
    it 'raises ObjectNotFound' do
      should.raise(BW::MIDI::MIDIException::ObjectNotFound) do
        BW::MIDI.status() { KMIDIObjectNotFound }
      end
    end
   
    it 'raises NotUnique' do
      should.raise(BW::MIDI::MIDIException::NotUnique) do
        BW::MIDI.status() { KMIDIIDNotUnique }
      end
    end

    it 'raises MIDIException' do
      should.raise(BW::MIDI::MIDIException) do
        BW::MIDI.status() { 1 }
      end
    end
  end

end
