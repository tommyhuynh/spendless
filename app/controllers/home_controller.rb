class HomeController < ApplicationController
  def index
  end

  def graphs
  	category = Category.all

    @this_week_pie_chart = category.map{|c| [c.name,c.expenses.
    	where(gains:false).where(:date => Time.now.beginning_of_week..Time.now.end_of_week).
    	sum("amount")]}.to_h
    @expense_this_week = Expense.where(:date => Time.now.beginning_of_week..Time.now, :gains => false).sum("amount")

    @last_week_pie_chart = category.map{|c| [c.name,c.expenses.
    	where(gains:false).where(:date => Time.now.last_week.beginning_of_week..Time.now.last_week.end_of_week).
    	sum("amount")]}.to_h
    @expense_last_week = Expense.where(:date => Time.now.last_week.beginning_of_week..Time.now.last_week.end_of_week, :gains => false).sum("amount")


    @daily_expense_data = Expense.where(:date => Time.now.last_week.beginning_of_week..Time.now.end_of_week, :gains => false).group_by_day(:date).sum("amount")
    @weekly_expense_data = Expense.where(gains:false).group_by_week(:date).sum("amount")
    @monthly_expense_data = Expense.where(gains:false).group_by_month(:date).sum("amount")

    @category_multiseries = category.map {|category| {name: category.name, data: category.expenses.where(:date => Time.now.last_week.beginning_of_week..Time.now.end_of_week, :gains => false).group_by_day(:date).sum("amount")}}


  end
end
