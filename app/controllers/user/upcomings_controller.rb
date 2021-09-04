require 'open-uri'
class User::UpcomingsController < ApplicationController
  def index 
    @ipos = upcoming_ipos.paginate(page: params[:ipo_page], per_page: 7)
    @nfos = upcoming_nfos.paginate(page: params[:nfo_page], per_page: 7)
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

  def upcoming_nfos
    Rails.cache.fetch('upcoming_nfos', expires_in: 24.hours) do
      html = URI.open('https://www.goodreturns.in/mutual-funds/new-fund-offers.html')
      doc = Nokogiri::HTML(html)
      arr = []
      
      doc.css('.moneyweb-stockTable').css('tr')[2..-1].each do |row|
        row = row.text.split("\n")
        dates = row[2].strip.split('  ')
        open = dates[0]
        close = dates[1]
        status = 
          if open.present? && (open.to_date <= Time.zone.now.to_date) && close.present? && (close.to_date >= Time.zone.now.to_date)
            'open'
          elsif close.present? && (close.to_date < Time.zone.now)
            'close'
          else 
            ''
          end
        arr << { name: row[1].strip, open: open, close: close, 
          offer_price: row[3].strip, min_amount: row[4].strip, 
          status: status
        }
      end
      puts arr
      arr.sort_by { |row| row[:open].to_date }
      arr
    end
  end
end
