class User < ApplicationRecord
  has_many :incomes
  has_many :expenses

  def total_expense
    expenses.pluck(:amount).sum
  end

  def total_incomes
    incomes.pluck(:amount).sum
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
