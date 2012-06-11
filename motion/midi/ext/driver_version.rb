module BubbleWrap
  module MIDI
    module Ext
      # Returns the driver version API of the owning driver (only for 
      # driver-owned devices). Drivers need not set this property; 
      # applications should not write to it.
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module DriverVersion

        def driver_version
          version_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyDriverVersion, version_p)}
          version_p[0]
        end

      end
    end
  end
end
