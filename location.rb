class Location
    def nurse
        @nurse
    end
    def nurse=(nurse)
        @nurse = nurse
    end
    def room
        @room
    end
    def room=(room)
        @room = room
    end
    def bed
        @bed
    end
    def bed=(bed)
        @bed = bed
    end
    def to_s
        "#{@nurse} #{@room} #{@bed}"
    end
end
