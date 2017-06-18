class ChangeAmountFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
	change_column :expenses, :amount, :decimal
  end
end
