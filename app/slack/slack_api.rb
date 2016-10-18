require 'json'
require 'httparty'

class SlackPost < WeatherRecording
  belongs_to :weather_recording

  def initialize
    @current_summary = WeatherRecording.update_description
    @temperature = WeatherRecording.update_temperature
  end

  def notify_slack

    webhook_url = 'https://hooks.slack.com/services/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'

    payload = {
      text: "It is #{@current_summary} in #{Location.name}. The temperature is #{@temperature} C."
    }

    HTTParty.post(URI.parse(webhook_url), payload: JSON.dump(payload))
  end
end
