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

  end

end

::MIDI = ::BubbleWrap::MIDI
