class IncomesController < ApplicationController
  def index
    @incomes = current_user.incomes
  end

  def new
    @incomes = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      flash[:notice] = "Income was successfully created"
      redirect_to incomes_path(@income)
    else
      render "new"
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
      flash[:notice] = "Income was successfully updated"
      redirect_to incomes_path(@income)
    else
      render "edit"
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    flash[:danger] = "Budget was successfully deleted"
    redirect_to incomes_path(@income)
  end

  private

  def income_params
    params.require(:income).permit(:amount, :description)
  end
end
