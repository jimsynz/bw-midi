module BubbleWrap
  module MIDI
    module Ext
      # Indicates whether the device or entity can route MIDI messages to or 
      # from other external MIDI devices (as with MIDI patch bays). This 
      # should NOT be set on devices which are controlled by drivers.
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module CanRoute

        def can_route
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyCanRoute, bool_p)}
          bool_p[0] == 1
        end

        def can_route=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyCanRoute, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
