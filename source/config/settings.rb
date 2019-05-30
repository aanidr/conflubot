# frozen_string_literal: true

module Settings
  extend self

  def slack_token
    @slack_token ||= ENV['SLACK_ACCESS_TOKEN']
  end
end
