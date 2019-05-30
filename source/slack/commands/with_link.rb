module Slack
  class WithLink < Base
    def initialize(channel)
      @channel = channel
    end

    private

    attr_reader :channel

    def payload
      {
        channel: channel,
        blocks: [{
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: 'Hello! Who is ready to check this article?'
          }
        }, {
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: 'Click the button and get to work!',
          }
        }, {
          type: 'actions',
          elements: [{
            type: 'button',
            text: {
              type: 'plain_text',
              text: 'Check the article',
              emoji: false
            }
          }]
        }]
      }
    end
  end
end
