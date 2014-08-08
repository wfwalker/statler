class Photo < ActiveRecord::Base
	has_many :performances
	attr_accessible :url
end
