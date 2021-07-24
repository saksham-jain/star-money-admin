require 'open-uri'
class User::DashboardController < ApplicationController
  def index
    @top_gainers = get_top_gainer.paginate(page: params[:top_gainers_page], per_page: 5)
    @ipos = upcoming_ipo
    @trades = Trade.todays
    @top_traded_scrip = @trades.group(:scrip).count.sort_by { |k, v| -v}.first(5)
    # @trades = current_client.trades.last_7_days
  end

  private

  def get_top_gainer
    html = URI.open('https://groww.in/stocks/top-gainers')
    doc = Nokogiri::HTML(html)

    arr = []

    doc.css('.tb10Table').css('.tgal438RowDiv').each do |scrip|
      arr << { name: scrip.css('a').text, change: scrip.css('.fs14.fw500').css('.fs12').text, price: scrip.css('.fs14.fw500').text }
      arr.last[:price].slice!(arr.last[:change])
    end
    puts arr
    arr.to_a
  end

  def upcoming_ipo
    html = URI.open('https://www.chittorgarh.com/report/mainboard-ipo-list-in-india-bse-nse/83/')
    doc = Nokogiri::HTML(html)

    arr = []

    doc.css('.table').css('tbody tr').each do |row|
      arr << { name: row.css('td')[0].text, exchange: row.css('td')[1].text, open: row.css('td')[2].text, close: row.css('td')[3].text, 
        lot_size: row.css('td')[4].text, issue_price: row.css('td')[5].text, issue_size: row.css('td')[6].text, open_now: row.css('td')[2].text.present? ? (row.css('td')[2].text&.to_date <= Time.now.to_date) : nil
      }
    end
    arr = arr.select { |row| row[:open]&.to_date&.month == Time.now.month && row[:close]&.to_date&.day >= Time.now.day }
    puts arr
    arr.sort_by { |row| row[:open].to_date }
  end
end
