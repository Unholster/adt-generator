require 'ruby-hl7'

class Pv1Segment
    def initialize
        base_pv1 = "PV1||I||Tr||||||Svc||||Inf||||Inpatient||Insurance|||||||||||||||||||MA|||||201302201456"
        @pv1 = HL7::Message::Segment::Default.new(base_pv1)
    end

    def set_pt_class(pt_class)
        @pv1.e2 = pt_class
    end

    def set_location(location)
        # Set previous location
        @pv1.e6 = @pv1.e3
        @pv1.e3 = location.nurse + "^" + location.room.to_s + "^" + location.bed
    end

    def set_hosp_service(svc)
        @pv1.e10 = svc
    end

    def set_pt_type(type)
        @pv1.e18 = type
    end

    def set_admit_date(date)
        @pv1.e44 = date
    end

    def set_discharge_date(date)
        @pv1.e45 = date
    end

    def get_segment
        return @pv1.to_s + "\n"
    end

    def to_s
        return get_segment
    end
end
