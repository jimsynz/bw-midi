module BubbleWrap
  module MIDI
    module Ext
      # UniqueID of an external device/entity/endpoint attached to this one. 
      # As of Mac OS X 10.3, Audio MIDI Setup maintains endpoint-to-external 
      # endpoint connections (in 10.2, it connected devices to devices). 
      # The property is non-existant or 0 if there is no connection.
      #
      # Beginning with CoreMIDI 1.3, this property may also be an array of
      # integers, to allow specifying that a driver object connects to
      # multiple external objects (via MIDI thru-ing or splitting).
      # This property may also exist for external devices/entities/endpoints, 
      # in which case it signifies a MIDI Thru connection to another external 
      # device/entity/endpoint (again, it is strongly recommended that it be 
      # an endpoint).
      #
      # Available in iOS 4.2 and later.
      module ConnectionUniqueID

        def connection_unique_id
          uid_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyUniqueID, uid_p)}
          uid_p[0]
        end

        def connection_unique_id=(id)
          if id.is_a? Enumerable
            MIDI.status{MIDIObjectSetData(midi_id, KMIDIPropertyConnectionUniqueID, id.to_a)}
          else
            MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyConnectionUniqueID, id)}
          end
          id
        end

      end
    end
  end
end
