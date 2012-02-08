class Location < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy

  validates_presence_of :address

  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
