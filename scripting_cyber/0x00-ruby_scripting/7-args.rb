#!/usr/bin/env ruby
def print_arguments

    if ARGV == []
        puts "No arguments provided."
    else
        ARGV.each_with_index { |arg, index|
            puts "#{index + 1}. #{arg}"
        }
    end
end
