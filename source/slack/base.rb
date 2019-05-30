# frozen_string_literal: true

module Slack
  class Base
    def call
      Net::HTTP.post(uri, payload.to_json, headers)
    end

    private

    def payload
      raise NotImplemented
    end

    def uri
      URI(base_uri + action)
    end

    def base_uri
      'https://slack.com/api/'
    end

    def action
      'chat.postMessage'
    end

    def headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{Settings.slack_token}"
      }
    end
  end
end

require_relative 'commands/unknown_message'
require_relative 'commands/with_link'
require_relative 'commands/bounce'
