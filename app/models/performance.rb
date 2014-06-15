class Performance < ActiveRecord::Base
  belongs_to :artist
  belongs_to :run
  belongs_to :role

  attr_accessible :artist_id, :role_id, :run_id
end
