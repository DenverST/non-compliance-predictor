class Debtor < ApplicationRecord
  after_create :calculate_score
end

def calculate_score
  @score = 0
  if self.sex.capitalize == "Male"
    @score += 700
  else self.sex.capitalize == "Female"
    @score += 300
  end
  self.update(score: @score)
end
