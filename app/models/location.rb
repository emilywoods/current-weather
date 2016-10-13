class Location < ApplicationRecord
  has_many :weather_recordings
<<<<<<< ae26dcdf0151fa3fc8bb3fa661e3646db8f5de92
=======
  
>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db
  before_save { name.capitalize! }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :latitude, presence: true, uniqueness: { case_sensitive: false }
  validates :longitude, presence: true, uniqueness: { case_sensitive: false }
<<<<<<< ae26dcdf0151fa3fc8bb3fa661e3646db8f5de92
=======

>>>>>>> Change new of DB to WeatherRecording from CurrentWeather. Connect weather to locations db

end
