class RemoveScoreFromDebtors < ActiveRecord::Migration[5.2]
  def change
    remove_column :debtors, :score, :integer
  end
end
