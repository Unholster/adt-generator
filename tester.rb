require './test'
require 'ruby-progressbar'
require './patient'
require 'command_line_reporter'
require './options'

class Tester
    def prompt_for_input
        print "Max Cases[10]: "
        @max_cases = gets.chomp()
        if @max_cases == ''
            @max_cases = 10
        end

        print 'Output File[C:\test\adt_sample.txt]: '
        @file_name = gets.chomp()
        if @file_name == ''
            @file_name = 'C:\test\adt_sample.txt'
        end

    end

    def run
        # Clear the file before writing.
        File.open(@file_name, 'w') { |file| file.write("") }

        test = Test.new
        msh = MshSegment.new
        progress = ProgressBar.create(:total => 10)

        @max_cases.times do |n|
            patient = Patient.new(test)

            test_case = test.get_random_case
            test_case.each do |msg_type|
                message = patient.get_message (msg_type)

                File.open(@file_name, 'a') { |file| file.write(message + "\n\n") }
            end
            progress.increment
        end
        puts ""
    end
end
