module BubbleWrap
  module MIDI
    module Ext
      #  Indicates whether the device or entity plays audio samples in 
      #  response to MIDI note messages.
      #
      #  New for CoreMIDI 1.3.
      #  Available in iOS 4.2 and later.
      module IsSampler

        def is_sampler
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsSampler, bool_p)}
          bool_p[0] == 1
        end

        def is_sampler=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsSampler, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
