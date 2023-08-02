class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable 

  belongs_to :role

  attr_accessor :full_name

  def full_name
    "#{first_name} #{last_name}"
  end
end
