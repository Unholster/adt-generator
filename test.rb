require './location'

class Test
    def initialize(include_merges = false)
        @include_merges = include_merges

        initialize_test_cases
        initialize_locations
        initialize_names
    end

    def get_random_case
        return @test_cases.sample
    end

    def get_random_location
        return @locations.sample
    end

    def get_random_first_name (sex)
        if sex.downcase == "m"
            return @men_first_names.sample
        else
            return @women_first_names.sample
        end
    end
    
    def get_random_last_name
        return @last_names.sample
    end

    def time_rand from = 0.0, to = Time.now
        Time.at(from + rand * (to.to_f - from.to_f))
    end

    def initialize_test_cases
        @test_cases = Array.new(3)

        # Basic admit, update patient info, and discharge.
        @test_cases[0] = Array.new(3)
        @test_cases[0][0] = 'A01'
        @test_cases[0][1] = 'A08'
        @test_cases[0][2] = 'A03'

        # Pre-admit, admit, discharge
        @test_cases[1] = Array.new(3)
        @test_cases[1][0] = 'A05'
        @test_cases[1][1] = 'A06'
        @test_cases[1][2] = 'A03'
        
        # Transfer a patient
        @test_cases[2] = Array.new(3)
        @test_cases[2][0] = 'A01'
        @test_cases[2][1] = 'A02'
        @test_cases[2][2] = 'A03'
    end

    def initialize_locations
        @locations = Array.new
        nurse_capacity = Random.new.rand(5..10)

        nurse_capacity.times do |nn|
            room_capacity = Random.new.rand(25..50)
            room_capacity.times do |rn|
                loc_a = Location.new
                loc_a.nurse = 'Unit' + nn.to_s
                loc_a.room = rn
                loc_a.bed = 'A'
                loc_b = Location.new
                loc_b.nurse = 'Unit' + nn.to_s
                loc_b.room = rn
                loc_b.bed = 'A'
                @locations.push(loc_a)
                @locations.push(loc_b)
            end
        end
    end

    def initialize_names
        @last_names = Array.new
        @last_names.push("Doe")
        @last_names.push("Smith")
        @last_names.push("Washington")
        @last_names.push("Jackson")
        @last_names.push("Anderson")
        @last_names.push("Johnson")
        @last_names.push("White")
        @last_names.push("Adams")
        @last_names.push("Fisher")
        @last_names.push("Campbell")
        @last_names.push("Taylor")
        @last_names.push("Underwood")
        @last_names.push("Young")
        @last_names.push("Baker")

        @women_first_names = Array.new
        @women_first_names.push("Emily")
        @women_first_names.push("Jane")
        @women_first_names.push("Diana")
        @women_first_names.push("Rose")
        @women_first_names.push("Sara")
        @women_first_names.push("Mary")
        @women_first_names.push("Tracey")
        @women_first_names.push("Fiona")
        @women_first_names.push("Donna")
        @women_first_names.push("Claire")
        @women_first_names.push("Irene")

        @men_first_names = Array.new
        @men_first_names.push("Adam")
        @men_first_names.push("Andrew")
        @men_first_names.push("Christopher")
        @men_first_names.push("Alan")
        @men_first_names.push("Jack")
        @men_first_names.push("John")
        @men_first_names.push("Henry")
        @men_first_names.push("Peter")
        @men_first_names.push("Stephen")
        @men_first_names.push("David")
        @men_first_names.push("Robert")
        @men_first_names.push("Stewart")
        @men_first_names.push("Thomas")
        @men_first_names.push("Sean")
        @men_first_names.push("Tim")
    end
end
