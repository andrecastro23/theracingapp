class AddTierToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :tier, :integer
  end
end
