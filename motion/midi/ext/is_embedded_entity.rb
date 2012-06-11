module BubbleWrap
  module MIDI
    module Ext
      # False if there are external MIDI connectors, true if not. 
      #
      # New for CoreMIDI 1.1 (Mac OS X 10.1)
      # Available in iOS 4.2 and later.
      module IsEmbeddedEntity

        def is_embedded_entity
          bool_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyIsEmbeddedEntity, bool_p)}
          bool_p[0] == 1
        end

        def is_embedded_entity=(bool)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyIsEmbeddedEntity, bool ? 1 : 0)}
          bool
        end

      end
    end
  end
end
