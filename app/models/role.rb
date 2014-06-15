class Role < ActiveRecord::Base
  belongs_to :play
  attr_accessible :name, :play_id

  def play_and_name
  	"#{play.title} > #{name}"
  end
end
