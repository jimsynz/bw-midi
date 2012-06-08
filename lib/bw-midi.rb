require "bw-midi/version"
BW.require 'motion/**/*.rb' do
  file('motion/midi.rb').uses_framework 'CoreMIDI'
  file('motion/midi/device.rb').depends_on 'motion/midi/midi_object.rb'
  file('motion/midi/entity.rb').depends_on 'motion/midi/midi_object.rb'
  file('motion/midi/midi_object.rb').depends_on 'motion/midi/midi_object_cache.rb'
end

