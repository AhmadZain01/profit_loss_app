class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    redirect_to expenses_path(@expense)
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      flash[:notice] = "Budget was successfully updated"
      redirect_to expenses_path(@expense)
    else
      render "edit"
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:danger] = "Budget was successfully deleted"
    redirect_to expenses_path(@expense)
  end

  def expense_params
    params.require(:expense).permit(:amount,:description)
  end
end
