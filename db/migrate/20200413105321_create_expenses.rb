class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.string :description, null: false
      t.timestamps
    end
  end
end
