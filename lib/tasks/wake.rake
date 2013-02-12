#!/usr/bin/env rake

require 'net/http'
require 'uri'

WEBAPPS = [
  'http://ws-blog.herokuapp.com',
]

namespace :wake do
  desc "Wake up some web apps"
  task :up do
    WEBAPPS.each do |webapp|
      uri = URI.parse(webapp)
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(Net::HTTP::Get.new(uri.request_uri))
      print "#{webapp}: #{response.body.length} bytes"
    end
  end
end
