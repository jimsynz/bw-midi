module BubbleWrap
  module MIDI
    module MIDIObjectCache

      module_function

      def [](x)
        (@cache ||= {})[x]
      end

      def []=(x,y)
        (@cache ||= {})[x] = y
      end

      def fetch(x)
        (@cache ||= {}).fetch(x)
      end

      def delete(x)
        (@cache ||= {}).delete(x)
      end

    end
  end
end
