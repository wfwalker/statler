class Photo < ActiveRecord::Base
	belongs_to :performance
	attr_accessible :url
end
