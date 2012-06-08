module BubbleWrap
  module MIDI
    class MIDIObject

      attr_accessor :id, :midi_ref
      attr_writer :properties

      def properties
        @properties ||= get_object_properties
      end

      def method_missing(method, *args)
        begin
          properties.fetch(method.to_s.camelize(false))
        rescue KeyError
          super
        end
      end

      private

      def get_object_properties
        dict = Pointer.new(:object)
        MIDIObjectGetProperties(midi_ref, dict, true)
        dict[0]
      end

    end
  end
end
