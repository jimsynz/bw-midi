module BubbleWrap
  module MIDI
    module Ext
      # The full POSIX path to a device or external device's icon, stored in 
      # any standard graphic file format such as JPEG, GIF, PNG and TIFF are 
      # all acceptable. (See CFURL for functions to convert between POSIX 
      # paths and other ways of specifying files.) The image's maximum size 
      # should be 128x128.
      # Drivers should set the icon on the devices they add.
      # A studio setup editor should allow the user to choose icons for 
      # external devices.
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module Image

        def image
          image_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetStringProperty(midi_id, KMIDIPropertyImage, image_p)}
          image_p[0]
        end

        def image=(image)
          MIDI.status{MIDIObjectSetStringProperty(midi_id, KMIDIPropertyImage, image)}
          image
        end

      end
    end
  end
end
