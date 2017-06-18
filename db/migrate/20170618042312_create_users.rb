class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.decimal :current_balance

      t.timestamps
    end
  end
end
