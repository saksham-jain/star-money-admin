class User::ClientsController < ApplicationController
  def show
    @trades = current_client.trades.last_7_days
    @message = 'Try your hand on trading' if @trades.count == 0 
    @message = 'Wow! Its nice to You have been actively trading in last 7 days' if @trades.count > 5 
  end 
  
  def activate
    
  end
end
