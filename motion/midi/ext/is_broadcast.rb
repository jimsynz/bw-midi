module BubbleWrap
  module MIDI
    module Ext
      # True if the endpoint broadcasts messages to all of the other endpoints 
      # in the device, false if not. Set by the owning driver; should not be 
      # touched by other clients. New for CoreMIDI 1.3.
      #
      # Available in iOS 4.2 and later.
      module IsBroadcast

        def is_broadcast
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsBroadcast, bool_p)}
          bool_p[0] == 1
        end

        def is_broadcast=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsBroadcast, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
