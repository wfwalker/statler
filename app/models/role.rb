class Role < ActiveRecord::Base
  belongs_to :play
  attr_accessible :name, :play_id
end
