class Debtor < ApplicationRecord
  after_create :calculate_score
end

BIGHASH = {
  "Female" => 0,
  "Male" => 1,
  "Single with Dependants" => 1,
  "Couple without Dependants" => 2,
  "Couple with Dependants" => 3,
  "Single without Dependants" => 4,
  "Unemployment or loss of income" => 21,
  "Ill health or absence of health insurance" => 10,
  "Other business reason or reason unknown" => 16,
  "Domestic discord or relationship breakdowns" => 2,
  "Excessive use of credit facilities including losses on repossessions, high interest payments and pressure selling" => 6,
  '"Personal reasons' => 19,
  "Other causes or causes unknown" => 17,
  '"Inability to collect debts due to disputes, faulty work or bad debts"' => 11,
  "Failure to keep proper books of account and costing record" => 7,
  '"Economic conditions affecting industry, including competition, credit restrictions, fall in prices or increases in cost"' => 3,
  '"Gambling, speculation & extravagance in living"' => 9,
  "Adverse legal action" => 0,
  "Excessive drawings including failure to provide for taxation" => 4,
  "Excessive interest payments on loan monies and capital losses on repayments" => 5,
  "Gambling or speculation" => 8,
  "Lack of business ability including underquoting or failure to assess potential of business" => 12,
  "Lack of sufficient initial working capital" => 13,
  "Liabilities due to guarantees" => 14,
  "Not Stated" => 15,
  "Seasonal conditions including floods and drought" => 20,
  "Unknown" => 22,
  "Yes" => 1,
  # Business Related
  "No" => 0,
  "$0-$49999" => 0,
  "$50000-$99999" => 1,
  "$100000-$149999" => 2,
  "$150000-$199999" => 3,
  "Government benefits/Pensions" => 2,
  "Gross Wages and Salary" => 3,
  "Unknown" => 10,
  "Self Employment" => 8,
  "Business earnings" => 0
}

BIGHASHTWO {
  # unsec debts
  "$0-$49999" => 0,
  "$50000-$99999" => 9,
  "$500000-$549999" => 10,
  "$600000-$649999" => 12,
  "$100000-$149999" => 1,
  "$200000-$249999" => 3,
  "$450000-$499999" => 8,
  "$200000-$249999" => 6,
  "$150000-$199999" => 2,
  "$300000-$349999" => 5,
  "$350000-$399999" => 11,
  "$750000-$799999" => 15,
  "$250000-$299999" => 4,
  "$400000-$449999" => 7,
  "$700000-$749999" => 14,
  "$650000-$699999" => 13,
  "$900000-$949999" => 18,
  "$850000-$899999" => 17,
  "$900000-$900000"=> 16,
  "$950000-$999999" => 19,
  "More Than $1000000" => 20,
  "Registered Trustee" => 1,
}

def calculate_score
  @score = 1 + exp(-(-4.04117189 + (-8.52492653e-02 * BIGHASH[:area]) + (-1.53843695e-03 * BIGHASH[:sex]) + (4.01603385e-01 * BIGHASH[:family]) + (1.17323380e-01 * (self.occupation).to_i) + (-6.19945090e-03 * BIGHASH[:cause]) + (1.70202585e-02 * BIGHASH[:business]) + (1.06435564e+00 * BIGHASH[:income]) +  (1.04708405e-01 * BIGHASH[:income_source]) +  (-4.85736631e-02 * BIGHASHTWO[:unsecured_debts]) + (6.84105205e-02 * BIGHASHTWO[:value_of_assets]) + (2.98097017e-02 * (self.non_compliance_type ? 1 : 0)) + (1.00908709e+01 * (self.num_instances).to_i)))
  @score = 1/@score
  self.update(score: @score)
end

coefficients = [-8.52492653e-02, -1.53843695e-03,  4.01603385e-01,
         1.17323380e-01, -6.19945090e-03,  1.70202585e-02,
         1.06435564e+00,  1.04708405e-01, -4.85736631e-02,
         6.84105205e-02,  2.98097017e-02,  1.00908709e+01]
intercept = -4.04117189
p = 1/(1 + exp(-(-4.04117189 + -8.52492653e-02*X1 + (-1.53843695e-03)*X2 + 4.01603385e-01 * X3 + 1.17323380e-01 * X4 + -6.19945090e-03 * X5 + 1.70202585e-02 * X6 + 1.06435564e+00 * X7 +  1.04708405e-01 * X8 +  -4.85736631e-02 * X9 + 6.84105205e-02 * X10 + 2.98097017e-02 * X11 + 1.00908709e+01 * X12)))

 428: 3116955,2010,Belconnen,80101,Australian Capital Territory,8ACTE,Australian Capital Territory,Male,Unknown,,,Unknown,Not Stated or Unknown,$0-$49999,Unknown,$0-$49999,$0-$49999,Administration,Offence Referral,None,0,$0,
 472: 3001355,2014,Gungahlin,80104,Australian Capital Territory,8ACTE,Australian Capital Territory,Male,Couple with Dependants,82,Construction and Mining Labourers,Other causes or causes unknown,No,$50000-$99999,Business earnings,$100000-$149999,$0-$49999,Bankrupt,Objection to Discharge,Extension to Bankruptcy Period,1,8 Years
