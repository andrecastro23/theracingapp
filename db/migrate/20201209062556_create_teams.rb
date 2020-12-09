class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :championships
      t.string :bio
      t.integer :manufacturer_id
      t.string :name
      t.integer :stable_count

      t.timestamps
    end
  end
end
