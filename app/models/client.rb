class Client < ApplicationRecord
  attr_accessor :full_name
  validates :reliance_client_code, presence: true
  has_many :trades, foreign_key: :client_id, primary_key: :reliance_client_code

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      client = find_by(reliance_client_code: row["reliance_client_code"]) || new
      client.attributes = row.compact.to_hash.slice(*row.to_hash.keys)
      client.save!
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
  
  def full_name
    "#{first_name} #{last_name}"
  end 
end
