module BubbleWrap
  module MIDI
    class Port < MIDIObject
      def destroy
        MIDIPortDispose(midi_id)
        super
      end
    end
  end
end
