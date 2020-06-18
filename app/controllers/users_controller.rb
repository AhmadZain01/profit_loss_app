class UsersController < ApplicationController
  def index
    @incomes = current_user.incomes.where(created_at: (params[:start_date].to_date)..(params[:end_date].to_date)).all
    @expenses = current_user.expenses.where(created_at: (params[:start_date].to_date)..(params[:end_date].to_date)).all
  end
end
