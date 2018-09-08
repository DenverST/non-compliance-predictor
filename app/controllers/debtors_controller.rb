class DebtorsController < ApplicationController

def index
  @debtors = Debtor.all
end

def show
  @debtor = Debtor.find(params[:id])
end

def current
  # @current_debtors = Debtor.where("?".to_i > 600, :score)
  @current_debtors = []
  Debtor.all.each do |debtor|
    if (debtor.score > 600) && (debtor.year.to_i > 2016)
      @current_debtors << debtor
    end
  end
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
    params.require(:debtor).permit(:unique_id, :year, :area, :sex, :family, :occupation, :cause, :income, :unsecured_debts, :value_of_assets, :non_compliance_type)
  end

end
