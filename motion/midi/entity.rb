module BubbleWrap
  module MIDI
    class Entity < MIDIObject

      def properties
        super
        @properties
      end

      def device
        device_p = Pointer.new(:uint)
        if MIDIEntityGetDevice(midi_id, device_p)
          Device.at(device_p[0])
        end
      end

      def destinations
        [].tap do |a|
          number_of_destinations.times do |i|
            a << Destination.at(MIDIEntityGetDestination(midi_id,i))
          end
        end
      end

      def sources
        [].tap do |a|
          number_of_sources.times do |i|
            a << Source.at(MIDIEntityGetSource(midi_id, i))
          end
        end
      end

      private

      def number_of_destinations
        MIDIEntityGetNumberOfDestinations(midi_id)
      end

      def number_of_sources
        MIDIEntityGetNumberOfSources(midi_id)
      end
      
    end
  end
end
