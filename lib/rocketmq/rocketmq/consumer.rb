module RocketMQ
  class Consumer
    def initialize(topic_name, instance_id, group_id)
      @topic_name = topic_name
      @instance_id = instance_id
      @group_id = group_id
    end

    def consume(batch: 3, timeout: 1000)
    end

    def commit(message)
      return true
    end

  end
end