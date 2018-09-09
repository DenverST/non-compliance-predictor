# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Debtor.destroy_all

require 'csv'

# filepath = 'non-compliance-in-personal-insolvencies.csv'
# filepath = "testing.csv"


# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# CSV.foreach(filepath, csv_options) do |row|
#   puts "#{row['Unique ID']} - #{row['Calendar Year Of Insolvency']}"
# end

# csv_text = File.read(Rails.root.join('db', 'testing.csv'))
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   puts "#{row['Unique ID']} - #{row['Calendar Year of Insolvency']} - #{row['SA3 of Debtor']}"
# end

csv_text = File.read(Rails.root.join('db', 'testing_two.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  @debtor = Debtor.new(unique_id: row['unique_id'], year: row['year'], area: row['SA3_Code'], sex: row['Sex'], family: row['family_situation'], occupation: row['occupation_code'], cause: row['cause'], income: row['income'], income_source: row['primary_income'], unsecured_debts: row['unsecured_debts'], value_of_assets: row['assets_value'], non_compliance_type: row['noncompliance_type'], business: row['business_related'], num_instances: row['num_instances'], probability: row['probability'], prediction: row['prediction'])
  @debtor.save!
end
