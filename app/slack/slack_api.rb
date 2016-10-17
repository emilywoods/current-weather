require 'json'
require 'httparty'

class SlackPost < ApplicationRecord

  def initialize
    @webhook_url = 'https://hooks.slack.com/services/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'
  end

  def notify_slack

    payload = {
      text: "This is our text"
    }

    request = HTTParty.post("#{@webhook_url}")
    request.body = payload.to_json

    response = HTTParty.get(request)

  end

end

slack = SlackPost.new
