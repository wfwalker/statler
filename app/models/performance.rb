class Performance < ActiveRecord::Base
	belongs_to :artist
	belongs_to :run
	belongs_to :role

	attr_accessible :artist_id, :role_id, :run_id

	def Performance.map_by_role_id(performance_list)
		performance_list.inject({}) { | map, performance |
		   map[performance.role_id] = performance ; map }
	end
end
