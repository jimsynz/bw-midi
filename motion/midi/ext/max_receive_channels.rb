module BubbleWrap
  module MIDI
    module Ext
      # Indicates the maximum number of MIDI channels on which a device may 
      # simultaneously receive MIDI Channel Messages. Common values are 0 
      # (devices which only respond to System Messages), 1 (non-multitimbral 
      # devices), and 16 (fully multitimbral devices). Other values are 
      # possible, for example devices which are multitimbral but have fewer 
      # than 16 "parts".
      #
      # New for CoreMIDI 1.3.
      # Available in iOS 4.2 and later.
      module MaxReceiveChannels

        def max_recieve_channels
          channels_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(mchannelsi_channels, KMIDIPropertyMaxReceiveChannels, channels_p)}
          channels_p[0]
        end

        def max_recieve_channels=(channels)
          raise ArgumentError, "channels must be between 0 and 16." if (channels < 0) || (channels > 16)
          MIDI.status{MIDIObjectSetIntegerProperty(mchannelsi_channels, KMIDIPropertyMaxReceiveChannels, channels)}
          channels
        end

      end
    end
  end
end
