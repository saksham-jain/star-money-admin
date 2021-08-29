class User::UpcomingsController < ApplicationController
  def index 
    @ipos = upcoming_ipos
  end

  private

  def upcoming_ipos
    Rails.cache.fetch('upcoming_ipos', expires_in: 24.hours) do
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
end
