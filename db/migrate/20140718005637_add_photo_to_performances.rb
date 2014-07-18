class AddPhotoToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :photo_id, :integer
    add_index :performances, :photo_id
  end
end
