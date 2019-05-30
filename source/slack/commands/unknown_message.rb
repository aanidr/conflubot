# frozen_string_literal: true

module Slack
  class UnknownMessage < Base
    def initialize(channel)
      @channel = channel
    end

    private

    attr_reader :channel

    def payload
      {
        text: "I'm sorry but I can't understand you.",
        channel: channel
      }
    end
  end
end
