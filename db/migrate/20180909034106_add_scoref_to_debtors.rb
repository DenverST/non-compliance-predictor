class AddScorefToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :scoref, :float
  end
end
