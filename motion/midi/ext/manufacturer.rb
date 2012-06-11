module BubbleWrap
  module MIDI
    module Ext
      # Drivers should set this property on their devices.
      # Setup editors may allow the user to set this property on external devices.
      # Creators of virtual endpoints may set this property on their endpoints.
      #
      # Available in iOS 4.2 and later.
      module Manufacturer

        def manufacturer
          manufacturer_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetStringProperty(midi_id, KMIDIPropertyManufacturer, manufacturer_p)}
          manufacturer_p[0]
        end

        def manufacturer=(manufacturer)
          MIDI.status{MIDIObjectSetStringProperty(midi_id, KMIDIPropertyManufacturer, manufacturer)}
          manufacturer
        end

      end
    end
  end
end
