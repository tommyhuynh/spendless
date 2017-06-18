class HomeController < ApplicationController
  def index
  end

  def graphs
  	category = Category.all
    @category_data = category.map{|c| [c.name,c.expenses.where(gains:false).sum("amount")]}.to_h
    @daily_expense_data = Expense.where(gains:false).group_by_day(:created_at).sum("amount")
  end
end
