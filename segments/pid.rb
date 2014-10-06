require 'ruby-hl7'

class PidSegment
    def initialize
        base_pid = "PID||||||||||||||||||"
        @pid = HL7::Message::Segment::Default.new(base_pid)
    end

    def get_mrn
        @pid.e3[0..@pid.e3.index('^')]
    end

    def set_mrn(mrn)
        @pid.e3 = mrn.to_s + "^^^^CMRN"
    end

    def set_name(last, first)
        @pid.e5 = last + "^" + first
    end

    def set_dob(dob)
        @pid.e7 = dob
    end

    def set_sex(sex)
        @pid.e8 = sex
    end

    def get_acct
        @pid.e18
    end

    def set_acct(acct)
        @pid.e18 = acct
    end

    def get_segment
        return @pid.to_s + "\n"
    end

    def to_s
        return get_segment
    end
end
