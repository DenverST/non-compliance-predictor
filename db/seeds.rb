# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

# filepath = 'non-compliance-in-personal-insolvencies.csv'
# filepath = "testing.csv"


# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# CSV.foreach(filepath, csv_options) do |row|
#   puts "#{row['Unique ID']} - #{row['Calendar Year Of Insolvency']}"
# end

csv_text = File.read(Rails.root.join('db', 'testing.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  puts "#{row['Unique ID']} - #{row['Calendar Year of Insolvency']} - #{row['SA3 of Debtor']}"
end
