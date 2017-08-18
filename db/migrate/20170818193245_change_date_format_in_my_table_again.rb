class ChangeDateFormatInMyTableAgain < ActiveRecord::Migration[5.0]
  def up
    change_column :expenses, :date, :datetime
  end

  def down
    change_column :expenses, :date, :date
  end
end
