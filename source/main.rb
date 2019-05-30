# frozen_string_literal: true

require_relative 'config/environment'

module ConfluBot
  module EventHandler
    extend self

    def handle(event:, context:)
      return { statusCode: 200, challenge: event['challenge'] } if event['challenge']

      event = Parsers::IncomingEvent.new(event).parse
      event.process

      { statusCode: 200 }
    end
  end
end
