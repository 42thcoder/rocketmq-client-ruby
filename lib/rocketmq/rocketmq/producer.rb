module RocketMQ
  class Producer
    def initialize(topic_name, instance_id)
      @topic_name = topic_name
      @instance_id = instance_id
    end

    def publish(topic_message)
      return ResponseMessage.new
    end
  end
end
