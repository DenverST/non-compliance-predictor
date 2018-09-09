class AddPrbabilityToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :probability, :string
  end
end
