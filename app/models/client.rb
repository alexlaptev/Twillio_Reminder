class Client < ActiveRecord::Base
  accepts_nested_attributes_for :user
  attr_accessible :f_name, :l_name
  belongs_to :user
  
end
