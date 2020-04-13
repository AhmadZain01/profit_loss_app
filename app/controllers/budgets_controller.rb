class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.save
    redirect_to budgets_path(@budget)
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      flash[:notice] = "Budget was successfully updated"
      redirect_to budgets_path(@budget)
    else
      render "edit"
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    flash[:danger] = "Budget was successfully deleted"
   redirect_to budgets_path(@budget)
  end

  def budget_params
    params.require(:budget).permit(:income, :expense, :description)
  end
end
