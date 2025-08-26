#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
    file_data = JSON.parse(File.read(path))

    user_ids = Hash.new(0)

    file_data.each { |id|
        user_ids[id["userId"]] += 1
    }

    user_ids.sort.each { |user_id, count|
        puts "#{user_id}: #{count}"
    }
end
