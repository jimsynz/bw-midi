class MIDIException
  DeviceException = Class.new(MIDIException)
  SourceException = Class.new(MIDIException)
  DestinationException = Class.new(MIDIException)
end
