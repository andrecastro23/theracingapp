class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :driver_photo
      t.integer :driver_number
      t.integer :tier
      t.integer :team_id
      t.string :bio
      t.string :crew_chief
      t.integer :manufacturer_id
      t.string :number_photo

      t.timestamps
    end
  end
end
