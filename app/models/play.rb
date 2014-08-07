class Play < ActiveRecord::Base
	belongs_to :playwright
	has_many :runs
	has_many :roles
	has_many :photos, :through => :runs, :uniq => true
	attr_accessible :notes, :premiere_year, :title, :playwright_id

	def Play.find_all_relevant
		Play.find_by_sql("SELECT DISTINCT plays.* FROM plays, runs WHERE runs.play_id=plays.id AND runs.year >= 1995 ORDER BY plays.title")
	end
end
