class AddScoreToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :score, :integer
  end
end
