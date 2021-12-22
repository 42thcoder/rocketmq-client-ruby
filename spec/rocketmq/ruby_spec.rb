# frozen_string_literal: true

RSpec.describe RocketMQ do
  it "has a version number" do
    expect(RocketMQ::VERSION).not_to be nil
  end

  it "get client instance" do
    expect(RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")).to be_a(RocketMQ::Client)
  end

  it "get producer instance" do
    client = RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")

    expect(client.producer("topic_name", "insance_id")).to be_a(RocketMQ::Producer)
  end

  it "publish message through producer" do
    client        = RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")
    topic_message = RocketMQ::TopicMessage.new(content: "hello world", tag: "tag", property: { "a": "b" })

    expect(client.producer("topic_name", "insance_id").publish(topic_message)).to be_a(RocketMQ::ResponseMessage)
  end

  it "get consumer instance" do
    client = RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")

    expect(client.consumer("topic_name", "insance_id", "group_id")).to be_a(RocketMQ::Consumer)
  end

  it "comsume message through long polling" do
    client   = RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")
    consumer = client.consumer("topic_name", "insance_id", "group_id")

    consumer.consume(batch: 3, timeout: 10) do |message|
      expect(message).to be_a(RocketMQ::ResponseMessage)
    end
  end

  it "ack message after consuming" do
    client   = RocketMQ::Client.new("http_endpotin", "access_key", "secret_key")
    consumer = client.consumer("topic_name", "insance_id", "group_id")

    consumer.consume(batch: 3, timeout: 10) do |message|
      expect(consumer.commit(message)).to be_true
    end
  end
end
