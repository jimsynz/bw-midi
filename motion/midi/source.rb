module BubbleWrap
  module MIDI
    class Source

      def initialize(id)
        @id = id
        @source = MIDIGetSource(id)
      end
    
    end
  end
end
