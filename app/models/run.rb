class Run < ActiveRecord::Base
  belongs_to :venue
  belongs_to :play
  attr_accessible :year, :venue_id, :play_id

  def year_and_play
  	"#{year} #{play.title}"
  end

  def Run.find_by_year_and_play_id(inYear, inPlayID)
  	return Run.find_by_sql ['SELECT * FROM runs where play_id=? and year=?', inPlayID, inYear]
  end
end
