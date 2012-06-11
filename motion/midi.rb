module BubbleWrap
  module MIDI

    module_function

    def devices(count=device_count)
      [].tap do |a|
        count.times do |i|
          a << Device.at(MIDIGetDevice(i))
        end
      end
    end

    def sources(count=source_count)
      [].tap do |a|
        count.times do |i|
          a << Source.at(MIDIGetSource(i))
        end
      end
    end

    def destinations(count=destination_count)
      [].tap do |a|
        count.times do |i|
          a << Destination.at(MIDIGetDestination(i))
        end
      end
    end

    def device_count
      MIDIGetNumberOfDevices()
    end

    def source_count
      MIDIGetNumberOfSources()
    end

    def destination_count
      MIDIGetNumberOfDestinations()
    end

    def status
      status = yield
      case status
      when KMIDIInvalidClient
        raise MIDIException::InvalidClient, "An invalid midi_ref was passed"
      when KMIDIInvalidPort
        raise MIDIException::InvalidPort, "An invalid midi_ref was passed"
      when KMIDIWrongEndpointType
        raise MIDIException::WrongEndpointType, "A source endpoint was passed to a method expecting a destination or vice versa"
      when KMIDINoConnection
        raise MIDIException::NonExistantConnection, "Attempt to close a non-existant connection"
      when KMIDIUnknownEndpoint
        raise MIDIException::UnknownEndpoint, "An invalid endpoint midi_ref was passed"
      when KMIDIUnknownProperty
        raise MIDIException::UnknownProperty, "Attempt to query a property not present on the device"
      when KMIDIWrongPropertyType
        raise MIDIException::WrongPropertyType, "Attempt to set a property with a value not of the correct type"
      when KMIDINoCurrentSetup
        raise MIDIException::NoCurrentSetup, "Internal error; there is no current MIDI setup object"
      when KMIDIMessageSendErr
        raise MIDIException::MessageSendError, "Communication with MIDI server failed"
      when KMIDIServerStartErr
        raise MIDIException::ServerStartError, "Unable to start MIDI server"
      when KMIDISetupFormatErr
        raise MIDIException::SetupFormatError, "Unable to read the saved state"
      when KMIDIWrongThread
        raise MIDIException::WrongThread, "A driver is calling a non-I/O function in the server from a thread other than the server's main thread"
      when KMIDIObjectNotFound
        raise MIDIException::ObjectNotFound, "The requested object does not exist"
      when KMIDIIDNotUnique
        raise MIDIException::NotUnique, "Attempt to set a non-unique unique id on an object"
      when 0
        return true
      else
        raise MIDIException, "An unknown error #{status.inspect} occurred."
      end
    end

  end

end

::MIDI = ::BubbleWrap::MIDI
