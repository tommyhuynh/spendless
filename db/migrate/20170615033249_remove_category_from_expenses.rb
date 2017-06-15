class RemoveCategoryFromExpenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :category, :text
  end
end
