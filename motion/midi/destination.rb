module BubbleWrap
  module MIDI
    class Destination

      def initialize(id)
        @id = id
        @destination = MIDIGetDestination(id)
      end
      
    end
  end
end
