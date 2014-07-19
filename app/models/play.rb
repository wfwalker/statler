class Play < ActiveRecord::Base
	belongs_to :playwright
	has_many :runs
	has_many :roles
	has_many :photos, :through => :runs
	attr_accessible :notes, :premiere_year, :title, :playwright_id
end
