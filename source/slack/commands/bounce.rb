module Slack
  class Bounce < Base
    def initialize(channel, event)
      @channel = channel
      @event = event
    end

    private

    attr_reader :channel, :event

    def payload
      {
        text: event,
        thread_ts: event['ts'],
        channel: channel
      }
    end
  end
end
