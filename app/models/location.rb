class Location < ApplicationRecord
  before_save { name.downcase! }

  validates :name, presence: true, length: { maximum: 70}, uniqueness: { case_sensitive: false }
  validates :latitude, presence: true, uniqueness: { case_sensitive: false }
  validates :longitude, presence: true, uniqueness: { case_sensitive: false }

end
