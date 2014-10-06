require 'ruby-hl7'

class MrgSegment
    def initialize
        # Reference Information: http://jwenet.net/notebook/1777/1248.html
        # 1: Prior PatientID (Internal)
        # 2: Prior Alt Patient ID
        # 3: Prior Pateint Account Number
        # 4: Prior Patient ID (External)
        # 5: Prior Visit Number
        # 6: Prior Alternate Visit ID
        # 7: Prior Patient Name
        base_mrg = "MRG|||||||"
        @mrg = HL7::Message::Segment::Default::new(base_mrg)
    end

    def set_old_mrn(mrn)
        @mrg.e1 = mrn
    end

    def set_old_account(acct)
        @mrg.e3 = acct
    end

    def set_old_name(name)
        @mrg.e7 = name
    end

    def get_segment
        @mrg.to_s + "\n"
    end

    def to_s
        get_segment
    end
end
