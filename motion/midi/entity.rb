module BubbleWrap
  module MIDI
    class Entity < MIDIObject
      include BubbleWrap::MIDI::Ext::AdvanceScheduleTime
      include BubbleWrap::MIDI::Ext::CanRoute
      include BubbleWrap::MIDI::Ext::ConnectionUniqueID
      include BubbleWrap::MIDI::Ext::DeviceID
      include BubbleWrap::MIDI::Ext::DisplayName
      include BubbleWrap::MIDI::Ext::DriverOwner
      include BubbleWrap::MIDI::Ext::DriverVersion
      include BubbleWrap::MIDI::Ext::IsBroadcast
      include BubbleWrap::MIDI::Ext::IsDrumMachine
      include BubbleWrap::MIDI::Ext::IsEffectUnit
      include BubbleWrap::MIDI::Ext::IsEmbeddedEntity
      include BubbleWrap::MIDI::Ext::IsMixer
      include BubbleWrap::MIDI::Ext::IsSampler
      include BubbleWrap::MIDI::Ext::MaxReceiveChannels

      def properties
        super
        @properties
      end

      def device
        device_p = Pointer.new(:uint)
        if MIDIEntityGetDevice(midi_id, device_p)
          Device.at(device_p[0])
        end
      end

      def destinations
        [].tap do |a|
          number_of_destinations.times do |i|
            a << Destination.at(MIDIEntityGetDestination(midi_id,i))
          end
        end
      end

      def sources
        [].tap do |a|
          number_of_sources.times do |i|
            a << Source.at(MIDIEntityGetSource(midi_id, i))
          end
        end
      end

      private

      def number_of_destinations
        MIDIEntityGetNumberOfDestinations(midi_id)
      end

      def number_of_sources
        MIDIEntityGetNumberOfSources(midi_id)
      end
      
    end
  end
end
