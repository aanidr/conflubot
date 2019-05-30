module Events
  class SlackBounce
    def initialize(channel, event)
      @channel = channel
      @event = event
    end

    def process
      Slack::Bounce.new(@channel, @event).call
    end
  end
end
