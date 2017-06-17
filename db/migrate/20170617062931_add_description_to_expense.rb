class AddDescriptionToExpense < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :descripton, :string
  end
end
