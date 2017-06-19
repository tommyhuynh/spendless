class HomeController < ApplicationController
  def index
  end

  def graphs
  	category = Category.all
    @category_data_this_week = category.map{|c| [c.name,c.expenses.where(gains:false, :created_at => Time.now.beginning_of_week..Time.now).sum("amount")]}.to_h
    @category_data_last_week = category.map{|c| [c.name,c.expenses.where(gains:false, :created_at => 1.week.ago.beginning_of_week..1.week.ago.end_of_week).sum("amount")]}.to_h
    @daily_expense_data = Expense.where(gains:false).group_by_day(:created_at).sum("amount")
  end
end
