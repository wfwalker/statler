class CreatePlaywrights < ActiveRecord::Migration
  def change
    create_table :playwrights do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
