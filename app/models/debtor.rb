class Debtor < ApplicationRecord
  after_create :calculate_score
end

SEX = {
  "Female" => 0,
  "Male" => 1,
  "Not Stated" => 2,
  "Unknown" => 3,
  nil => 0
}

FAMILY = {
  "Single without Dependants" => 0,
  "Single with Dependants" => 1,
  "Couple without Dependants" => 2,
  "Couple with Dependants" => 3,
  "Unknown" => 4,
  "Not Stated" => 5,
  nil => 0
}

CAUSE = {
  "Adverse legal action" => 0,
  "Domestic discord or relationship breakdown" => 1,
  "Domestic discord or relationship breakdowns" => 2,
  '"Economic conditions affecting industry, including competition, credit restrictions, fall in prices or increases in cost"' => 3,
  'Excessive drawings including failure to provide for taxation' => 4,
  'Excessive interest payments on loan monies and capital losses on repayments' => 5,
  "Excessive use of credit facilities including losses on repossessions, high interest payments and pressure selling" => 6,
  "Failure to keep proper books of account and costing record" => 7,
  "Gambling or speculation" => 8,
  '"Gambling, speculation & extravagance in living"' => 9,
  "Ill health or absence of health insurance" => 10,
  '"Inability to collect debts due to disputes, faulty work or bad debts"' => 11,
  "Lack of business ability including underquoting or failure to assess potential of business" => 12,
  "Lack of sufficient initial working capital" => 13,
  "Liabilities due to guarantees" => 14,
  "Not Stated" => 15,
  "Other business reason or reason unknown" => 16,
  "Other causes or causes unknown" => 17,
  "Personal reasons, including ill health of self or dependents, domestic discord & other personal reasons" => 18,
  '"Personal reasons' => 19,
  "Seasonal conditions including floods and drought" => 20,
  "Unemployment or loss of income" => 21,
  "Unknown" => 22,
  nil => 0
 }

 INCOME = {
  '$0-$49999' => 0,
  '$50000-$99999' => 1,
  '$100000-$149999' => 2,
  '$150000-$199999' => 3,
  'More Than $200000' => 4,
  nil => 0
 }

 BUSINESS = {
  # Business Related
  "No" => 0,
  "Yes" => 1,
  "Not Stated or Unknown" => 2,
  nil => 0
}

PRIMARY = {
  'Business earnings' => 0,
  'Deceased Estate or Trusts' => 1,
  'Government benefits/Pensions' => 10,
  'Gross Wages and Salary' => 2,
  'Income from Investments' => 3,
  'Income from reverse mortgage' => 4,
  'Lump Sum termination payments' => 5,
  'Other' => 6,
  'Self Employment' => 7,
  'Superannuation' => 8,
  'Unknown' => 9,
   nil => 0
}

DEBTS = {
  # unsec debts
  "$0-$49999" => 0,
  "$$250000-$299999" => 1,
  "$450000-$499999" => 2,
  "$300000-$349999" => 3,
  "$550000-$599999" => 4,
  "$500000-$549999" => 5,
  "$400000-$449999" => 6,
  "$600000-$649999" => 7,
  "$350000-$399999" => 8,
  "$100000-$149999" => 9,
  "$150000-$199999" => 10,
  "'$950000-$999999" => 11,
  "$200000-$249999" => 12,
  "$700000-$749999" => 13,
  "$$650000-$699999" => 14,
  "$50000-$99999" => 15,
  "More Than $1000000" => 16,
  "$800000-$849999" => 17,
  "$750000-$799999" => 18,
  "$900000-$949999" => 19,
  "$850000-$899999" => 20,
  nil => 0
}

# def calculate_score
#   @score = 1 + Math.exp(-(-4.69812858 + (3.98211350e-01 * (SEX[:sex] || 0).to_f + (1.16155944e-01 * (FAMILY[:family] || 0)).to_f + (-7.15849006e-03 * (self.occupation  || 0).to_i).to_f + (1.51790148e-02 * (CAUSE[:cause] || 0)).to_f + (1.00351347e+00 * (BUSINESS[:business] || 0)).to_f + (4.27699874e-02 * (INCOME[:income] || 0)).to_f + (-3.09722201e-02 * (PRIMARY[:income_source] || 0)).to_f + (7.24779573e-02 * (DEBTS[:unsecured_debts] || 0)).to_f + (2.44275831e-02 * (DEBTS[:value_of_assets] || 0)).to_f + (9.80159282e+00 * (self.num_instances || 0).to_i).to_f))).to_f
#   @score = (1/@score).to_f
#   self.update(score: @score)
#   Giving really low numbers
# end

# def calculate_score
#   @score = rand(150..900)
#   self.update(score: @score)
# end

def calculate_score
  @probability = self.probability.to_f
  @prediction = self.prediction.to_f
  if (@prediction == 0) || (@prediction == 0.0)
    @score = 1.0 - @probability
  else
    @score = @probability
  end
  self.update(scoref: @score)
end


