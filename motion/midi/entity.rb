module BubbleWrap
  module MIDI
    class Entity < MIDIObject

      def initialize(id)
        self.midi_ref = id
      end

      def properties
        super
        @properties
      end
      
    end
  end
end
