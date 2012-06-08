if respond_to?(:require)

  framework 'CoreMIDI'

  require File.expand_path('../../motion/midi.rb', __FILE__)
  require File.expand_path('../../motion/midi/midi_object.rb', __FILE__)
  require File.expand_path('../../motion/midi/device.rb', __FILE__)
  require File.expand_path('../../motion/midi/entity.rb', __FILE__)
  require File.expand_path('../../motion/midi/source.rb', __FILE__)
  require File.expand_path('../../motion/midi/destination.rb', __FILE__)

  class String
    # Convert 'snake_case' into 'CamelCase'
    def camelize(uppercase_first_letter = true)
      string = self.dup
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) do
        new_word = $2.downcase
        new_word[0] = new_word[0].upcase
        new_word = "/#{new_word}" if $1 == '/'
        new_word
      end
      if uppercase_first_letter
        string[0] = string[0].upcase
      else
        string[0] = string[0].downcase
      end
      string.gsub!('/', '::')
      string
    end

    # Convert 'CamelCase' into 'snake_case'
    def underscore
      word = self.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end
  end

end

BW = BubbleWrap unless defined?(BW)
