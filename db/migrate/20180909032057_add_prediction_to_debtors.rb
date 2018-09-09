class AddPredictionToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :prediction, :string
  end
end
