module BubbleWrap
  module MIDI
    module Ext
      # Indicates whether the device or entity is primarily a MIDI-controlled 
      # audio effect unit (i.e. does not generate sound on its own).
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module IsEffectUnit

        def is_effect_unit
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsEffectUnit, bool_p)}
          bool_p[0] == 1
        end

        def is_effect_unit=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsEffectUnit, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
