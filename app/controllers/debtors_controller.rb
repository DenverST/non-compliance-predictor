class DebtorsController < ApplicationController

def index
  @debtors = Debtor.all
end

def show
  @debtor = Debtor.find(params[:id])
end

def current
  @this_year_total_sum = 0
  @this_year_total_count = 0
  @all_time_total_sum = 0
  @all_time_total_count = Debtor.all.count
  @current_debtors = []
  Debtor.all.each do |debtor|
    @all_time_total_sum += debtor.score
    if debtor.year.to_i > 2017
      @this_year_total_sum += debtor.score
      @this_year_total_count += 1
    end
    if (debtor.score > 600) && (debtor.year.to_i > 2016)
      @current_debtors << debtor
    end
  end
  @all_time_rating = (@all_time_total_sum / @all_time_total_count).to_f
  @this_year_rating = (@this_year_total_sum / @this_year_total_count).to_f
  @current_debtors
end

def new
  @debtor = Debtor.new
end

def create
  @debtor = Debtor.new(debtor_params)
  if @debtor.save!
    redirect_to debtor_path(@debtor)
  else
    render :new
  end
end


private

  def debtor_params
    params.require(:debtor).permit(:unique_id, :year, :area, :sex, :family, :occupation, :cause, :income, :unsecured_debts, :value_of_assets, :non_compliance_type, :business, :num_instances, :prediction, :probability)
  end

end
