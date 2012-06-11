module BubbleWrap
  module MIDI
    module Ext
      # The system assigns unique ID's to all objects. Creators of virtual 
      # endpoints may set this property on their endpoints, though doing so 
      # may fail if the chosen ID is not unique.
      #
      # Available in iOS 4.2 and later.
      module UniqueID

        def unique_id
          uid_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyUniqueID, uid_p)}
          uid_p[0]
        end

        def unique_id=(id)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyUniqueID, id)}
          id
        end

      end
    end
  end
end
