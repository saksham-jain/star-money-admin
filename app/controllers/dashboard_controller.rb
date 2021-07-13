class DashboardController < ApplicationController
  def index
    @trades = Trade.todays
    @client_wise_trade = @trades.group(:client_name).count.sort_by {|_key, value| -value}.to_h

    @clients = Client.all
  end
end
