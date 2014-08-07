class Artist < ActiveRecord::Base
  has_many :performances, :include => :run, :order => 'runs.year'
  has_many :photos, through: :performances
  attr_accessible :name
end
