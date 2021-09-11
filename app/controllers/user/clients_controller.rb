class User::ClientsController < ApplicationController
  def show
    @trades = current_client.trades&.last_60_days&.paginate(page: params[:page], per_page: 7)
    @message = 'Try your hand on trading' if @trades.present? && @trades.count == 0 
    @message = 'Wow! Its nice to You have been actively trading in last 7 days' if @trades.present? && @trades.count > 5 
  end 
  
  def activate
    @client = Client.new
  end

  def confirm_activate
    client = Client.find_by(reliance_client_id: client_params[:reliance_client_id], email: client_params[:email])

    unless client_params[:password] == client_params[:confirm_password]
      @client = Client.new(client_params.except(:confirm_password))
      flash.now[:warning] = 'Password and confirm Password does not match'
      render :activate and return
    end

    if client
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
    params.require(:client).permit(:reliance_client_id, :email, :password, :confirm_password)
  end
end
