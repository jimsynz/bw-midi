module BubbleWrap
  module MIDI
    module Ext
      # The entity's system-exclusive ID, in user-visible form
      # Drivers may set this property on their devices or entities.
      # Setup editors may allow the user to set this property on external 
      # devices.
      #
      # Available in iOS 4.2 and later.
      module DeviceID

        def device_id
          id_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyDeviceID, id_p)}
          id_p[0]
        end

        def device_id=(id)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyDeviceID, id)}
          id
        end

      end
    end
  end
end
