module BubbleWrap
  module MIDI
    class OutputPort < Port
      def self.create(client, name, id=rand(0xffff))
        midi_id_p = Pointer.new(:uint)
        midi_id_p[0] = id
        refcon_p = Pointer.new(:object)
        refcon_p[0] = id
        MIDI.status{MIDIOutputPortCreate(client.midi_ref, refcon_p, midi_id_p)}
        self.new midi_id_p[0]
      end
    end
  end
end
