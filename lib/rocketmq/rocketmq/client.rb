require_relative 'producer'
require_relative 'consumer'

module RocketMQ
  class Client
    def initialize(http_endpoint, access_key, secret_key)
      @http_endpoint = http_endpoint
      @access_key    = access_key
      @secret_key    = secret_key
    end

    def producer(topic_name, instance_id)
      Producer.new(topic_name, instance_id)
    end

    def consumer(topic_name, instance_id, group_id)
      Consumer.new(topic_name, instance_id, group_id)
    end
  end
end