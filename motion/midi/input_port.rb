module BubbleWrap
  module MIDI
    class InputPort < Port
      def self.create(client, name, id=rand(0xffff))
        midi_id_p = Pointer.new(:uint)
        midi_id_p[0] = id
        refcon_p = Pointer.new(:object)
        refcon_p[0] = id
        MIDI.status{MIDIInputPortCreate(client.midi_id, name, method(:incoming_midi_packets), refcon_p, midi_id_p)}
        self.at(midi_id_p[0]).tap { |m| m.refcon = refcon_p[0] }
      end

      def self.incoming_midi_packets(packet_list, port_id, source_id)
        puts "Incoming packets #{packet_list.inspect}, port_id #{port_id.inspect}, source_id #{source_id.inspect}"
      end
    end
  end
end
