module RocketMQ
  class TopicMessage
    def initialize(content: "", tag: "", property: {})
      @content = content
      @tag = tag
      @property = property
    end
  end
end
