class Artist < ActiveRecord::Base
  has_many :performances
  has_many :photos, through: :performances
  attr_accessible :name
end
