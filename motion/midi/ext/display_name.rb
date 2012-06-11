module BubbleWrap
  module MIDI
    module Ext
      # Provides the Apple-recommended user-visible name for an endpoint, by 
      # combining the device and endpoint names.
      # For objects other than endpoints, the display name is the same as the 
      # name.
      #
      # New for CoreMIDI 1.5.
      # Available in iOS 4.2 and later.
      module DisplayName

        def display_name
          name_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetStringProperty(midi_id, KMIDIPropertyDisplayName, name_p)}
          name_p[0]
        end

        def display_name=(name)
          MIDI.status{MIDIObjectSetStringProperty(midi_id, KMIDIPropertyDisplayName, name)}
          name
        end

      end
    end
  end
end
