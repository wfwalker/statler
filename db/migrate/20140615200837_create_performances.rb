class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :artist
      t.references :run
      t.references :role

      t.timestamps
    end
    add_index :performances, :artist_id
    add_index :performances, :run_id
    add_index :performances, :role_id
  end
end
