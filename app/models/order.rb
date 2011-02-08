class Order < ActiveRecord::Base

  before_save :generate_public_id

  belongs_to :client

  attr_accessible :comments, :device_description, :device_count, :task_description

  #validates :public_id, :uniqueness => true, :presence => true

  scope :active, where(:is_active => true)

  def generate_public_id

    self.public_id = "#{client_id}@#{id}"
    
  end
  
end


