class User < ApplicationRecord
  has_many :incomes
  has_many :expenses

  def total_expenses
    expenses.pluck(:amount).sum
  end

  def total_incomes
    incomes.pluck(:amount).sum
  end

  def profit_loss
    total_incomes - total_expenses
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
