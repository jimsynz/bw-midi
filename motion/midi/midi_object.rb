module BubbleWrap
  module MIDI
    class MIDIObject
      include ::BubbleWrap::MIDI::Ext::UniqueID

      attr_accessor :midi_id, :refcon
      attr_writer :properties

      def self.at(midi_id)
        MIDIObjectCache[midi_id] ||= self.new(midi_id)
      end

      def initialize(midi_id)
        self.midi_id = midi_id
      end

      def properties
        @properties ||= get_object_properties
      end

      def refresh_properties
        @properties = get_object_properties
      end

      def method_missing(method, *args)
        begin
          properties.fetch(method.to_s.camelize(false))
        rescue KeyError
          super
        end
      end

      def respond_to?(method)
        begin
          !!properties.fetch(method.to_s.camelize(false))
        rescue KeyError
          super
        end
      end

      def destroy
        MIDIObjectCache.delete(midi_id)
      end

      private

      def get_object_properties
        dict = Pointer.new(:object)
        MIDIObjectGetProperties(midi_id, dict, false)
        dict = dict[0]
        dict.delete('uniqueId') if dict['uniqueId']
        dict
      end

    end
  end
end
