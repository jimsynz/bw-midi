module BubbleWrap
  module MIDI
    module Ext

      # Set by the owning driver; should not be touched by other clients. If 
      # it is non-zero, then it is a recommendation of how many microseconds 
      # in advance clients should schedule output. Clients should treat this 
      # value as a minimum. For devices with a non-zero advance schedule time, 
      # drivers will receive outgoing messages to the device at the time they 
      # are sent by the client, via MIDISend, and the driver is responsible 
      # for scheduling events to be played at the right times according to 
      # their timestamps.
      # As of CoreMIDI 1.3, this property may also be set on virtual 
      # destinations (but only the creator of the destination should do so). 
      # When a client sends to a virtual destination with an advance schedule 
      # time of 0, the virtual destination receives its messages at their 
      # scheduled delivery time. If a virtual destination has a non-zero 
      # advance schedule time, it receives timestamped messages as soon as 
      # they are sent, and must do its own internal scheduling of received 
      # events.
      #
      # Available in iOS 4.2 and later.
      module AdvanceScheduleTime

        def advance_schedule_time
          usec_p = Pointer.new(:int)
          MIDI.status{MIDIObjectGetIntegerProperty(midi_id, KMIDIPropertyAdvanceScheduleTimeMuSec, usec_p)}
          usec_p[0]
        end

        def advance_schedule_time=(usec)
          MIDI.status{MIDIObjectSetIntegerProperty(midi_id, KMIDIPropertyAdvanceScheduleTimeMuSec, usec)}
          usec
        end

      end
    end
  end
end
