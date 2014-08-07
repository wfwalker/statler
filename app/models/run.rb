class Run < ActiveRecord::Base
  belongs_to :venue
  belongs_to :play
  has_many :performances
  has_many :photos, :through => :performances, :uniq => true
  attr_accessible :year, :venue_id, :play_id

  scope :relevant, :conditions => [ 'runs.year >= 1995' ], :order => 'runs.year'

  def year_and_play
  	"#{year} #{play.title}"
  end

  def Run.find_by_year_and_play_id(inYear, inPlayID)
  	return Run.find_by_sql ['SELECT * FROM runs where play_id=? and year=?', inPlayID, inYear]
  end

	def Run.map_by_play_id(run_list)
		run_list.inject({}) { | map, run |
		   map[run.play_id] ? map[run.play_id] << run : map[run.play_id] = [run] ; map }
	end
end
