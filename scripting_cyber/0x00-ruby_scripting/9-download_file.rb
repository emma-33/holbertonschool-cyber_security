#!/usr/bin/env ruby
require 'fileutils'
require 'open-uri'
require 'uri'

if ARGV.length != 2
    puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
    exit 1
end
url, path = ARGV

begin
    puts "Downloading file from #{url}..."
    URI.open(url) { |url_file|
        File.open(path, "wb") { |file|
            file.write(url_file.read)
        }
    }
    puts "File downloaded and saved to #{path}."
end
