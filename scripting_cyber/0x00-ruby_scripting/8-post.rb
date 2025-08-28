#!/usr/bin/env ruby
require 'net/http'
require 'uri'

def post_request(url, body_params)
    uri = URI(url)
    response = Net::HTTP.post_form(uri, body_params)
    puts response.body if response.is_a?(Net::HTTPSuccess)
end
