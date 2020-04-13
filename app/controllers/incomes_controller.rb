class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.save
    redirect_to incomes_path(@income)
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(@income)
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

  def income_params
    params.require(:income).permit(:amount, :description)
  end
end
