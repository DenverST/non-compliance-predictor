class DebtorsController < ApplicationController

def index
  @debtors = Debtor.all
end

def show
  @debtor = Debtor.find(params[:id])
end

def new
  @debtor = Debtor.new
end

def create
  @debtor = Debtor.new(debtor_params)
  if @debtor.save!
    redirect_to
  else
    render :new
  end
end


private

  def debtor_params
    params.require(:debtor).permit(:unique_id, :year, :area, :sex, :family, :occupation, :cause, :income, :unsecured_debts, :value_of_assets, :non_compliance_type)
  end

end
