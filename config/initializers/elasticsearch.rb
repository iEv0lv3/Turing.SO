# if Rails.env == 'production'
#   require 'elasticsearch'
#   require 'elasticsearch/api'
#   require 'faraday'
#   require 'faraday_middleware'
#   require 'faraday_middleware/aws_sigv4'

#   Elasticsearch::Model.client = Elasticsearch::Client.new(host: ENV['AWS_ES'], port: 443) do |faraday|
#     faraday.request :aws_sigv4,
#                     service: 'es',
#                     region: 'us-west-2',
#                     access_key_id: ENV['AWS_ACCESS_KEY'],
#                     secret_access_key: ENV['AWS_SECRET_KEY']
#   end
# end
