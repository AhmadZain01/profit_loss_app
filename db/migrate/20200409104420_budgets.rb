class Budgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.decimal :income, null: false, default: 0
      t.decimal :expense, null: false, default: 0
      t.string  :description, null: false
      t.timestamps
    end  
  end
end
