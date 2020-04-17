class UsersController < ApplicationController
  def index
    @date_start = DateTime.now
    @date_end = @date_start - 7.hour
    @incomes = current_user.incomes.where(:created_at => @date_end..@date_start).all  
    render :index 
  end
end 