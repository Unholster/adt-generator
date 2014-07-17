require 'ruby-hl7'
require 'securerandom'

class MshSegment
    def initialize
        @base_msh = "MSH|^~\\&|App|Fac|BedReady|IWT||||||D|2.3"
        @base_evn = "EVN||"
    end

    def create_msh_evn(type)
        msh = HL7::Message::Segment::Default.new( @base_msh )
        evn = HL7::Message::Segment::Default.new( @base_evn )
        timestamp = Time.new.strftime("%Y%m%d%H%M%S")

        msh.e7 = timestamp
        msh.e9 = "ADT^" + type
        msh.e10 = SecureRandom.hex

        evn.e1 = type
        evn.e2 = timestamp

        return msh.to_s + "\n" + evn.to_s + "\n"
    end
end
