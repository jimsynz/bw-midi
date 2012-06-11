module BubbleWrap
  module MIDI
    class Destination < MIDIObject
      include BubbleWrap::MIDI::Ext::AdvanceScheduleTime
      include BubbleWrap::MIDI::Ext::ConnectionUniqueID
      include BubbleWrap::MIDI::Ext::DisplayName
      include BubbleWrap::MIDI::Ext::DriverOwner
      include BubbleWrap::MIDI::Ext::DriverVersion
      include BubbleWrap::MIDI::Ext::IsBroadcast
      include BubbleWrap::MIDI::Ext::IsEmbeddedEntity
      include BubbleWrap::MIDI::Ext::Manufacturer

      def self.create(client, name, id=rand(0xffff))
        midi_id_p = Pointer.new(:uint)
        midi_id_p[0] = id
        refcon_p = Pointer.new(:object)
        refcon_p[0] = id
        MIDI.status{MIDIDestinationCreate(client.midi_id, name, method(:incoming_midi_packets),refcon_p, midi_id_p)}
        self.at(midi_id_p[0]).tap { |m| m.refcon = refcon_p[0] }
      end

    end
  end
end
