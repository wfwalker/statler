class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.references :play

      t.timestamps
    end
    add_index :roles, :play_id
  end
end
