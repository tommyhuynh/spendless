class AddGainsToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :gains, :boolean, :default => false
  end
end
