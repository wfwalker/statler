class Run < ActiveRecord::Base
  belongs_to :venue
  belongs_to :play
  attr_accessible :year, :venue_id, :play_id
end
