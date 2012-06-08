class MIDIException < Exception; end
class DeviceException < MIDIException; end
class SourceException < MIDIException; end
class DestinationException < MIDIException; end
