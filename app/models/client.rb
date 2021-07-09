class Client < ApplicationRecord
  require 'csv'

  attr_accessor :full_name

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      Client.create! row.to_h
    end
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end 
end
