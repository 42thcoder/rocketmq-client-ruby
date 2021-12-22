# frozen_string_literal: true

require_relative 'rocketmq/response_message'
require_relative 'rocketmq/topic_message'
require_relative 'rocketmq/client'
require_relative "rocketmq/version"

module RocketMQ
  def self.new(**options)
    Client.new(options)
  end
end
