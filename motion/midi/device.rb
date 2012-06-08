module BubbleWrap
  module MIDI
    class Device < MIDIObject

      def initialize(id)
        self.id = id
        self.midi_ref = MIDIGetDevice(id)
      end

      def offline
        properties['offline'] == 1
      end

      def online
        !offline
      end

      def entities
        properties['entities'].map do |entity|
          Entity.new(entity['uniqueID'])
        end
      end

    end
  end
end
