# frozen_string_literal: true

module Events
  class SlackMessageWithLink
    def initialize(channel, event)
      @channel = channel
      @event = event
    end

    def process
      Slack::WithLink.new(@channel).call
    end
  end
end
