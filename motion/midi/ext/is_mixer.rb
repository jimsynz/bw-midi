module BubbleWrap
  module MIDI
    module Ext
      # Indicates whether the device or entity mixes external audio signals, 
      # controlled by MIDI messages.
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module IsMixer

        def is_mixer
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsMixer, bool_p)}
          bool_p[0] == 1
        end

        def is_mixer=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsMixer, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
