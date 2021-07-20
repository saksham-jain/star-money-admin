class User::DashboardController < ApplicationController
  def index
    @trades = current_client.trades.last_7_days
  end
end
