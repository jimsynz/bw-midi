module BubbleWrap
  module MIDI
    class Source < MIDIObject
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
        MIDI.status{MIDISourceCreate(client.midi_id, name, midi_id_p)}
        self.at(midi_id_p[0])
      end

    end
  end
end
