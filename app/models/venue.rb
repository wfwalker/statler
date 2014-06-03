class Venue < ActiveRecord::Base
	has_many :runs
	attr_accessible :name, :organization
end
