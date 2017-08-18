class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def up
    change_column :expenses, :date, :date
  end

  def down
    change_column :expenses, :date, :datetime
  end
end
