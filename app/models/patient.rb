class Patient < ActiveRecord::Base
  validates_length_of :name, :minimum => 2
  validates_length_of :phone_number, :minimum => 4
  belongs_to :doctor

end
