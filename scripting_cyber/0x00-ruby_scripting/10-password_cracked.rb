#!/usr/bin/env ruby

require 'digest'

if ARGV.length != 2
    puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
    exit 1
end

hashed_password, dictionary_file = ARGV

begin
    File.foreach(dictionary_file) { |word|
        word.strip!
        hash = Digest::SHA256.hexdigest(word)
        if hash == hashed_password
            puts "Password found: #{word}"
            exit 0
        end
    }
    puts "Password not found in dictionary."
end
