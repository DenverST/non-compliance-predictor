class AddNumInstancesToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :num_instances, :string
  end
end
