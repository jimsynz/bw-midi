module BubbleWrap
  module MIDI

    class << self

      def devices(count=device_count)
        [].tap do |a|
          count.times do |id|
            a << Device.new(id)
          end
        end
      end

      def sources(count=source_count)
        [].tap do |a|
          count.times do |id|
            a << Source.new(id)
          end
        end
      end

      def destinations(count=destination_count)
        [].tap do |a|
          count.times do |id|
            a << Destination.new(id)
          end
        end
      end

      private

      def device_count
        device_count = MIDIGetNumberOfDevices()
        raise DeviceException, "Unable to retrieve number of connected devices" if device_count == 0
        device_count
      end

      def source_count
        source_count = MIDIGetNumberOfSources()
        raise SourceException, "Unable to retrieve number of sources" if source_count == 0
        source_count
      end

      def destination_count
        dest_count = MIDIGetNumberOfDestinations()
        raise DestinationException, "Unable to retrieve number of destinations" if dest_count == 0
        dest_count
      end

    end

  end
end

::MIDI = ::BubbleWrap::MIDI
