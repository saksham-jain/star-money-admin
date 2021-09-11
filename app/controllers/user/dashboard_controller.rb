require 'open-uri'
class User::DashboardController < ApplicationController
  def index
    @top_gainers = get_top_gainers.paginate(page: params[:top_gainers_page], per_page: 5)
    @top_losers = get_top_losers.paginate(page: params[:top_losers_page], per_page: 5)
    @trades = Trade.todays
    @top_traded_scrips = @trades.group(:scrip).count.sort_by { |k, v| -v}.first(5)
    # @trades = current_client.trades.last_7_days
  end

  private

  def get_top_gainers
    if request.xhr? || (Time.zone.now > Time.zone.parse('15:30')) || Time.zone.now.on_weekend?
      Rails.cache.fetch('top_gainers')  { scrap_top_gainers }
    else
      result = scrap_top_gainers
      Rails.cache.write('top_gainers', result)
      result
    end
  end

  def scrap_top_gainers
    html = URI.open('https://trendlyne.com/stock-screeners/price-based/top-gainers/today/index/BSE500/bse-500/')
    doc = Nokogiri::HTML(html)

    arr = []

    doc.css('tbody').css('tr').first(25).each do |scrip|
      arr << { name: scrip.css('a').text, change: scrip.css('td')[2].text.strip, ltp: scrip.css('td')[1].text.strip }
    end
    puts arr
    arr
  end

  def get_top_losers
    if request.xhr? || (Time.zone.now > Time.zone.parse('15:30')) || Time.zone.now.on_weekend?
      Rails.cache.fetch('top_losers')  { scrap_top_losers }
    else
      result = scrap_top_losers
      Rails.cache.write('top_losers', result)
      result
    end
  end

  def scrap_top_losers
    html = URI.open('https://trendlyne.com/stock-screeners/price-based/top-losers/today/index/BSE500/bse-500/')
    doc = Nokogiri::HTML(html)

    arr = []

    doc.css('tbody').css('tr').first(25).each do |scrip|
      arr << { name: scrip.css('a').text.strip, ltp: scrip.css('td')[1].text.strip, change: scrip.css('td')[2].text.strip }
    end
    puts arr
    arr
  end
end
