require 'json'
require 'httparty'

class SlackPost < WeatherRecording

  def initialize
    @current_summary = WeatherRecording.update_description
    @temperature = WeatherRecording.update_temperature
  end

  def self.notify_slack

    webhook_url = 'https://hooks.slack.com/services/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'

    payload = {
      text: "It is #{@current_summary} in #{@location.name}. The temperature is #{@wtemperature} C."
    }
    HTTParty.post(URI.parse(webhook_url), payload: JSON.dump(payload))

  end
end
