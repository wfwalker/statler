class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :year
      t.references :venue
      t.references :play

      t.timestamps
    end
    add_index :runs, :venue_id
    add_index :runs, :play_id
  end
end
