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

csv_text = File.read(Rails.root.join('db', 'non-compliance-in-personal-insolvencies.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  @debtor = Debtor.new(unique_id: row['Unique ID'], year: row['Calendar Year of Insolvency'], area: row['SA3 of Debtor'], sex: row['Sex of Debtor'], family: row['Family Situation'], occupation: row['Debtor Occupation Name (ANZSCO)'], cause: row['Main Cause of Insolvency'], income: row['Debtor Income'], income_source: row['Primary Income Source'], unsecured_debts: row['Unsecured Debts'], value_of_assets: row['Value of Assets'], non_compliance_type: row['Non-Compliance Type'], business: row['Business Related Insolvency'], num_instances: row['Number of Instances'])
  @debtor.save!
end
