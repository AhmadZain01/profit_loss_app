class Income < ApplicationRecord
  belongs_to :user
  def self.total_value
    sum(:amount)
  end
end
