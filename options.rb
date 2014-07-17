require 'command_line_reporter'

class Options
    include CommandLineReporter

    def initialize
        self.formatter = 'progress'
    end

    def print_header(use_large_header = false)
        if use_large_header
            file = File.open('.\title.txt', 'r')
            while (line = file.gets)
                puts line
            end
            file.close
        else
            header :title=> "ADT Message Generator", :width => 80, :align => 'center', :rule => false
        end
    end

    def print_options
        puts "Options"
        puts " c\t- prompts for number of cases to create, then creates messages for them."
        puts " e\t- exit"
        puts "\r\n"
    end
end
