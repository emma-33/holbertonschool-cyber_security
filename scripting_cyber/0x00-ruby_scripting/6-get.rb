#!/usr/bin/env ruby
require 'net/http'
require 'uri'

def get_request(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    puts response.body if response.is_a?(Net::HTTPSuccess)
end
