module BubbleWrap
  module MIDI
    class Client < MIDIObject

      attr_accessor :input_ports, :output_ports

      def initialize(*_)
        super
        self.input_ports = {}
        self.output_ports = {}
      end

      def self.create(name, id=rand(0xffff))
        midi_id_p = Pointer.new(:uint)
        midi_id_p[0] = id
        refcon_p = Pointer.new(:object)
        refcon_p[0] = id
        MIDI.status{ MIDIClientCreate(name, method(:notification), refcon_p, midi_id_p) }
        self.new midi_id_p[0]
      end

      def self.notification(message, refcon)
        puts "notification: #{message.inspect}, #{refcon.inspect}"
      end

      def create_input_port(name)
        self.input_ports[name] = BubbleWrap::MIDI::InputPort.create(self, name)
      end

      def create_output_port(name)
        self.output_ports[name] = BubbleWrap::MIDI::OutputPort.create(self,name)
      end

      def ports
        input_ports.values + output_ports.values
      end

      def destroy
        MIDIClientDispose(midi_id)
        super
      end

    end
  end
end

