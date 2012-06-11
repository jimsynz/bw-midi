module BubbleWrap
  module MIDI
    class Device < MIDIObject
      include BubbleWrap::MIDI::Ext::AdvanceScheduleTime
      include BubbleWrap::MIDI::Ext::CanRoute
      include BubbleWrap::MIDI::Ext::ConnectionUniqueID
      include BubbleWrap::MIDI::Ext::DeviceID
      include BubbleWrap::MIDI::Ext::DisplayName
      include BubbleWrap::MIDI::Ext::DriverDeviceEditorApp
      include BubbleWrap::MIDI::Ext::DriverOwner
      include BubbleWrap::MIDI::Ext::DriverVersion
      include BubbleWrap::MIDI::Ext::Image
      include BubbleWrap::MIDI::Ext::IsDrumMachine
      include BubbleWrap::MIDI::Ext::IsEffectUnit
      include BubbleWrap::MIDI::Ext::IsMixer
      include BubbleWrap::MIDI::Ext::IsSampler
      include BubbleWrap::MIDI::Ext::Manufacturer
      include BubbleWrap::MIDI::Ext::MaxReceiveChannels

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
