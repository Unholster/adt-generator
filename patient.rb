require './segments/msh'
require './segments/pid'
require './segments/pv1'
require './test'

class Patient
    def initialize(test)
        @test = test
        # New patient segments per case set
        @msh = MshSegment.new
        @pid = PidSegment.new
        @pv1 = Pv1Segment.new

        mrn = Random.new.rand(542000..542999)
        acct = Random.new.rand(1240000..1249999)
        sex = rand(0..1) == 0 ? "m" : "f"
        first_name = @test.get_random_first_name(sex)
        last_name = @test.get_random_last_name
        dob = @test.time_rand
        dob_formatted = dob.strftime("%Y%m%d")

        @pid.set_mrn(mrn)
        @pid.set_acct(acct)
        @pid.set_sex(sex)
        @pid.set_name(last_name, first_name)
        @pid.set_dob(dob_formatted)
    end

    def get_message(msg_type)
        case msg_type.downcase
        when "a01"
            set_a01
        when "a08"
            set_a08
        when "a03"
            set_a03
        when "a05"
            set_a05
        when "a06"
            set_a06
        when "a02"
            set_a02
        end

        header = @msh.create_msh_evn msg_type
        message = header + @pid.to_s + @pv1.to_s
        return message
    end

    # TODO: Create more message type related changes
    def set_a01
        loc = @test.get_random_location
        @pv1.set_location(loc)
        @pv1.set_pt_type('Inpatient')

        admit_date = Time.now.strftime("%Y%M%d%H%M%S")
        @pv1.set_admit_date(admit_date)
    end

    def set_a08
        dob = @test.time_rand
        dob_formatted = dob.strftime("%Y%m%d")
        @pid.set_dob(dob_formatted)

        loc = @test.get_random_location
        @pv1.set_location(loc)
    end

    def set_a03
        discharge_date = Time.now.strftime("%Y%m%d%H%M%S")
        @pv1.set_discharge_date(discharge_date)
    end

    def set_a05
        @pv1.set_pt_type('Outpatient')

        admit_date = Time.now.strftime("%Y%m%d%H%M%S")
        @pv1.set_admit_date(admit_date)
    end

    def set_a06
        @pv1.set_pt_type('Inpatient')
        loc = @test.get_random_location
        @pv1.set_location(loc)
    end

    def set_a02
        loc = @test.get_random_location
        @pv1.set_location(loc)
    end
end
