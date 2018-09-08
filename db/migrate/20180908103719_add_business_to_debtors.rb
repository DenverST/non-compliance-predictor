class AddBusinessToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :business, :string
  end
end
