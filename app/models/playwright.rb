class Playwright < ActiveRecord::Base
	has_many :plays, :order => 'plays.title' 
	has_many :runs, through: :plays do
		def relevant
			where('runs.year >= 1995')
		end
	end
	attr_accessible :name, :notes
end
