# frozen_string_literal: true

module Events
  class SlackUnknownMessage
    def initialize(channel, event)
      @channel = channel
      @event = event
    end

    def process
      Slack::UnknownMessage.new(@channel).call
    end
  end
end
