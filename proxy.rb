require 'rubygems'
require 'sinatra'
require 'open-uri'

SERVERS = ['graphical.weather.gov']

class Proxy < Sinatra::Base
  get '/info' do
    "This is the Proxy. Allowed servers: #{SERVERS}"
  end

  # Takes one parameter, url
  get '/' do
    headers 'Access-Control-Allow-Origin: ' => '*'

    url = URI.parse(params[:url])
    # The servers it is OK to fetch from
    if SERVERS.index(url.host).nil?
      puts 'disallowed'
      "server disallowed"
      return
    else
      url.read
    end
  end
end

