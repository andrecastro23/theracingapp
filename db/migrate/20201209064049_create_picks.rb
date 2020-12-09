class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.integer :driver_id
      t.integer :user_id

      t.timestamps
    end
  end
end
