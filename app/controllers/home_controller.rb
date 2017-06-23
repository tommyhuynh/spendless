class HomeController < ApplicationController
  def index
  end

  def graphs
  	category = Category.all
  	last_week_expenses = Expense.where(:created_at => 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
  	this_week_expenses = Expense.where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week)
    @category_data = category.map{|c| [c.name,c.expenses.where(gains:false).sum("amount")]}.to_h
    @last_week_expenses = Expense.where(gains:false).where(:created_at => Time.now.last_week.beginning_of_week..Time.now.end_of_week)
    @this_week_expenses = Expense.where(gains:false).where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week)

    @all_time_category_data = category.map{|c| [c.name,c.expenses.
    	where(gains:false).
    	sum("amount")]}.to_h
    @last_week_category_data = category.map{|c| [c.name,c.expenses.
    	where(gains:false).where(:created_at => Time.now.last_week.beginning_of_week..Time.now.last_week.end_of_week).
    	sum("amount")]}.to_h
    @this_week_category_data = category.map{|c| [c.name,c.expenses.
    	where(gains:false).where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week).
    	sum("amount")]}.to_h

    @daily_expense_data = Expense.where(gains:false).group_by_day(:created_at).sum("amount")
    @weekly_expense_data = Expense.where(gains:false).group_by_week(:created_at).sum("amount")
    @monthly_expense_data = Expense.where(gains:false).group_by_month(:created_at).sum("amount")

	@category_multiseries = category.map {|category| {name: category.name, data: category.expenses.group_by_day(:created_at).sum("amount")}}


  end
end
