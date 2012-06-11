module BubbleWrap
  module MIDI
    module Ext
      # Contains the full path to an application which knows how to configure 
      # this driver-owned devices. Drivers may set this property on their 
      # owned devices. Applications must not write to it.
      #
      # New for CoreMIDI 1.4.
      # Available in iOS 4.2 and later.
      module DriverDeviceEditorApp

        def driver_device_editor_app
          app_p = Pointer.new(:string)
          MIDI.status{MIDIObjectGetStringProperty(midi_id, KMIDIPropertyDriverDeviceEditorApp, app_p)}
          app_p[0]
        end

        def driver_device_editor_app=(app)
          MIDI.status{MIDIObjectSetStringProperty(midi_id, KMIDIPropertyDriverDeviceEditorApp, app)}
          app
        end

      end
    end
  end
end
