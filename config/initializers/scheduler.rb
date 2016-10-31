require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '3h' do
  WeatherRecording.update_all_weather

end
