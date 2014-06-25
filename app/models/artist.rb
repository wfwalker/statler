class Artist < ActiveRecord::Base
  has_many :performances
  attr_accessible :name
end
