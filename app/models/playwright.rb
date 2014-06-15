class Playwright < ActiveRecord::Base
  has_many :plays
  has_many :runs, through: :plays
  attr_accessible :name, :notes
end
