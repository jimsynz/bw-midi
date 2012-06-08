module BubbleWrap
  module MIDI
    class Client < MIDIObject

      def self.create(name, id=nil)
        id ||= rand(65534)
        midi_id_p = Pointer.new(:uint)
        refcon_p = Pointer.new(:object)
        refcon_p[0] = id
        status = MIDIClientCreate(name, method(:notification), refcon_p, midi_id_p)
        return self.new(midi_id_p[0]) if status == 0
        false
      end

      def self.notification(message, refcon)
        puts "notification: #{message.inspect}, #{refcon.inspect}"
      end

    end
  end
end

