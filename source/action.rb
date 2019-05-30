# frozen_string_literal: true

require_relative 'config/environment'

module ConfluBot
  module ActionHandler
    extend self

    def handle(payload:)
      action = Parsers::IncomingAction.new(payload).parse
      action.process

      { statusCode: 200 }
    end
  end
end
