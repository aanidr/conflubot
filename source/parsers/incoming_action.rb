# frozen_string_literal: true

module Parsers
  class IncomingAction < OpenStruct
    def parse
      if slack_message_event?
        return Events::SlackIgnoreMessage.new if user.nil? || link.nil?

        Events::SlackMessageWithLink.new(channel, event)
      else
        Events::SlackUnknownMessage.new(channel, event)
      end
    end

    private

    def user
      @user ||= event['user']
    end

    def channel
      @channel ||= event['channel']
    end

    def text
      @text ||= event['text']
    end

    def link
      @link ||= text.match(%r{netguru.atlassian.net/wiki/[\w/]*/\d+/WIP})
    end

    def slack_message_event?
      !(channel.nil? || text.nil?)
    end
  end
end
