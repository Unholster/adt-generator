require './test'
require './patient'
require 'command_line_reporter'
require './options'
require './tester'
require 'ruby-progressbar'

# Cygwin freezes when reading a character otherwise. I have no idea how this fixes it.
# win32console is a gem that must be installed.
require 'win32console' if RbConfig::CONFIG['host_os'].include? "mingw32"

opt = Options.new
opt.print_header
opt.print_options 

def read_char
    # http://stackoverflow.com/questions/174933/how-to-get-a-single-character-without-pressing-enter
    begin
      system("stty raw -echo")
      str = STDIN.getc
    ensure
      system("stty -raw echo")
    end

    return str.chr
end

inp = read_char

while inp != 'e'
    if inp == 'c'
        tester = Tester.new
        tester.prompt_for_input
        tester.run
        opt.print_options
    end

    inp = read_char
end

puts "Generator closed."
