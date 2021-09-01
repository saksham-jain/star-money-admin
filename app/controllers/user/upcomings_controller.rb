require 'open-uri'
class User::UpcomingsController < ApplicationController
  def index 
    @ipos = upcoming_ipos.paginate(page: params[:page], per_page: 7)
  end

  private

  def upcoming_ipos
    Rails.cache.fetch('upcoming_ipos', expires_in: 24.hours) do
      html = URI.open('https://www.chittorgarh.com/report/mainboard-ipo-list-in-india-bse-nse/83/')
      doc = Nokogiri::HTML(html)
      arr = []
      
      doc.css('.table').css('tbody tr').each do |row|
        open = row.css('td')[2].text
        close = row.css('td')[3].text
        status = 
          if open.present? && (open.to_date <= Time.zone.now.to_date) && close.present? && (close.to_date >= Time.zone.now.to_date)
            'open'
          elsif close.present? && (close.to_date < Time.zone.now)
            'close'
          else 
            ''
          end
        arr << { name: row.css('td')[0].text, exchange: row.css('td')[1].text, open: open, close: close, 
          lot_size: row.css('td')[4].text, issue_price: row.css('td')[5].text, issue_size: row.css('td')[6].text,
          status: status
        }
      end
      puts arr
      arr = arr.select { |row| row[:open].present? }
      arr.sort_by { |row| row[:open].to_date }
      arr
    end
  end
end
