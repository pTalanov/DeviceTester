class Client < ActiveRecord::Base

  validates :company_name, :uniqueness => true, :presence => true

  has_many :orders
  
end
