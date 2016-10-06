class Location < ApplicationRecord
  before_save { name.downcase! }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :latitude, presence: true, length: { maximum: 4 }, uniqueness: { case_sensitive: false }
  validates :longitude, presence: true, length: { maximum: 4 }, uniqueness: { case_sensitive: false }

end
