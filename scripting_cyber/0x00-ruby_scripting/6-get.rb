#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

def get_request(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    response_body = JSON.parse(response.body)

    puts "Response status: #{response.code} #{response.message}"
    puts "Response body:"
    puts JSON.pretty_generate(response_body)
end
