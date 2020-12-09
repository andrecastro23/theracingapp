class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :logo
      t.string :make
      t.integer :teams_count

      t.timestamps
    end
  end
end
