class Admin::DashboardController < ApplicationController
  def index
    @trades = Trade.todays
    @client_wise_trade = ActiveRecord::Base.connection.execute(sql_raw_query_for_client_wise_trade)
      .sort_by { |record| -record['total_trade_value'] }

    @clients = Client.all

    @top_traded_scrip = @trades.group(:scrip).count.sort_by { |k, v| -v}.first(10)
  end

  def sql_raw_query_for_client_wise_trade
    <<-SQL
      SELECT client_id, client_name, count(*) as trades, sum(price*quantity) as total_trade_value 
      FROM trades 
      WHERE date::date = '#{Time.now.to_date.to_s}'
      GROUP BY client_id, client_name
    SQL
  end
end
