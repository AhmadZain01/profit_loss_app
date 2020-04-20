class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      flash[:success] = "Expense was created successfully"
      redirect_to expenses_path(@expense)
    else
      render new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      flash[:notice] = "Expense was successfully updated"
      redirect_to expenses_path(@expense)
    else
      render "edit"
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:danger] = "Expense was successfully deleted"
    redirect_to expenses_path(@expense)
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :description)
  end
end
