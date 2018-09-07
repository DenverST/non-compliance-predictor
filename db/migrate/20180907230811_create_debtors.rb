class CreateDebtors < ActiveRecord::Migration[5.2]
  def change
    create_table :debtors do |t|
      t.string :unique_id
      t.string :year
      t.string :area
      t.string :sex
      t.string :family
      t.string :occupation
      t.string :cause
      t.string :income
      t.string :income_source
      t.string :unsecured_debts
      t.string :value_of_assets
      t.string :non_compliance_type

      t.timestamps
    end
  end
end
