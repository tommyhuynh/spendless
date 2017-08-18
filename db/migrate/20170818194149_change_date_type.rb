class ChangeDateType < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:expenses, :date, nil)
  end
end
