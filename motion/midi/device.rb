module BubbleWrap
  module MIDI
    class Device < MIDIObject

      def offline
        properties['offline'] == 1
      end

      def online
        !offline
      end

      def entities
        [].tap do |a|
          MIDIDeviceGetNumberOfEntities(midi_id).times do |i|
            a << Entity.at(MIDIDeviceGetEntity(midi_id, i))
          end
        end
      end

    end
  end
end
