class Location < ApplicationRecord
  has_many :weather_recordings
  
  before_save { name.capitalize! }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :latitude, presence: true, uniqueness: { case_sensitive: false }
  validates :longitude, presence: true, uniqueness: { case_sensitive: false }


end
