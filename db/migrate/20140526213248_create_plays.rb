class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title
      t.text :notes
      t.integer :premiere_year
      t.references :playwright

      t.timestamps
    end
    add_index :plays, :playwright_id
  end
end
