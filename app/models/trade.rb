class Trade < ApplicationRecord
  belongs_to :client, foreign_key: :client_id, primary_key: :reliance_client_code

  enum order_type: {
    CNC: CNC = 0,
    NRML: NRML = 1,
    MIS: MIS = 2,
    CO: CO = 3
  }

  enum transaction_type: {
    BUY: BUY = 0,
    SELL: SELL = 1
  }

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = ['exchange', 'actionee', 'client_id', 'client_name', 'order_type', 'transaction_type', 'scrip', 'price', 'quantity', 'time', 'date', 'platform']
    (1..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      trade = new
      trade.attributes = row.compact.to_hash.slice(*row.to_hash.keys)
      trade.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
