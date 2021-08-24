class User::ClientsController < ApplicationController
  def show
    @trades = current_client.trades.last_60_days.paginate(page: params[:page], per_page: 7)
    @message = 'Try your hand on trading' if @trades.count == 0 
    @message = 'Wow! Its nice to You have been actively trading in last 7 days' if @trades.count > 5 
  end 
  
  def activate
    @client = Client.new
  end

  def confirm_activate
    client = Client.find_by(reliance_client_code: client_params[:reliance_client_code], email: client_params[:email])
    if client && check_password
      client.update(password: client_params[:password], activated: true)
    else
      @client = Client.new(client_params.except(:confirm_password))
      flash.now[:warning] = 'Wrong UserID or Email'
      render :activate and return
    end
    flash[:notice] = 'Signed Up successfully!'
    redirect_to new_client_session_path
  end

  private

  def client_params
    params.require(:client).permit(:reliance_client_code, :email, :password, :confirm_password)
  end
  
  def check_password
    client_params[:password] == client_params[:confirm_password]
  end
end
