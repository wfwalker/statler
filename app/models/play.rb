class Play < ActiveRecord::Base
  belongs_to :playwright
  has_many :roles
  attr_accessible :notes, :premiere_year, :title, :playwright_id
end
