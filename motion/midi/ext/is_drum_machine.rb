module BubbleWrap
  module MIDI
    module Ext
      # Indicates whether the device or entity's sound presets tend to be 
      # collections of non-transposable samples (e.g. drum kits).
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module IsDrumMachine

        def is_drum_machine
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsDrumMachine, bool_p)}
          bool_p[0] == 1
        end

        def is_drum_machine=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsDrumMachine, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
