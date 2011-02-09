

class Order < ActiveRecord::Base

  belongs_to :client

  attr_accessible :comments, :device_description, :device_count, :task_description

  #validates :public_id, :uniqueness => true, :presence => true, :on => :create
  #validates :client_id, :presence => true
  #validates :device_count, :numericality => true, :length => {:minimum => 1}

  scope :active, where(:is_active => true)

end


