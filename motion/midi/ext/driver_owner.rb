module BubbleWrap
  module MIDI
    module Ext
      # Name of the driver that owns a device. Set by the owning driver, on 
      # the device; should not be touched by other clients. Property is 
      # inherited from the device by its entities and endpoints.
      #
      # New for CoreMIDI 1.1 (Mac OS X 10.1)
      # Available in iOS 4.2 and later.
      module DriverOwner

        def driver_owner
          owner_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetStringProperty(midi_id, KMIDIPropertyDriverOwner, owner_p)}
          owner_p[0]
        end

      end
    end
  end
end
