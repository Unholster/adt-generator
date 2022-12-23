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
        else
            @max_cases = @max_cases.to_i
        end

        print 'Output File[adt_sample.txt]: '
        @file_name = gets.chomp()
        if @file_name == ''
            @file_name = 'adt_sample.txt'
        end

    end

    def run
        # Clear the file before writing.
        File.open(@file_name, 'w') { |file| file.write("") }

        test = Test.new
        progress = ProgressBar.create(:total => @max_cases)

        @max_cases.times do |n|
            patient = Patient.new(test)

            case ['basic', 'preadmit', 'transfer', 'a34_merge'].sample
            when 'basic'
                print_message(patient.get_message('A01'))
                print_message(patient.get_message('A08'))
                print_message(patient.get_message('A03'))
            when 'preadmit'
                print_message(patient.get_message('A05'))
                print_message(patient.get_message('A06'))
                print_message(patient.get_message('A03'))
            when 'transfer'
                print_message(patient.get_message('A01'))
                print_message(patient.get_message('A02'))
                print_message(patient.get_message('A03'))
            when 'a34_merge'
                print_message(patient.get_message('A01'))
                patient2 = Patient.new(test)
                print_message(patient2.get_message('A01'))
                patient2.add_mrg(patient.get_mrn, patient.get_acct)
                print_message(patient2.get_message('A34'))
            end
            progress.increment
        end
        puts ""
    end

    def print_message(msg)
        File.open(@file_name, 'a') { |file| file.write(msg + "\n\n") }
    end
end
