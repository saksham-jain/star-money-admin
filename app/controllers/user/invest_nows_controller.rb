class User::InvestNowsController < ApplicationController
  def create 
    invest_now = InvestNow.new(invest_now_params)
    if invest_now.save
      flash[:success] = 'Your request has been submitted. You will be contacted soon'
      render js: "window.location = '/upcomings'"
    else
      puts ">>>>>>>>>>#{invest_now.errors.full_messages.join(', ')}"
      render js: "toastr.warning(`#{invest_now.errors.full_messages.join('<br>')}`)"
    end
  end

  private

  def invest_now_params
    params.require(:invest_now).permit(:first_name, :last_name, :phone_number, :email, :request_for)
  end
end
