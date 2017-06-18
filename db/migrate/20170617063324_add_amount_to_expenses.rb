class AddAmountToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :amount, :decimal
  end
end
