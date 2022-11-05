require 'sinatra'
require 'digest'

get '/' do
  'You need to pass something over the URL'
end

get '/:hash' do |hash|
  Digest::SHA512.hexdigest(hash)
end
