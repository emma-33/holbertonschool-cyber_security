#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

def post_request(url, body_params)
    uri = URI(url)
    response = Net::HTTP.post_form(uri, body_params)

    response_body = JSON.parse(response.body)

    puts "Response status: #{response.code} #{response.message}"
    puts "Response body:"
    puts JSON.pretty_generate(response_body) if response.is_a?(Net::HTTPSuccess)
end
