class Doctor < ActiveRecord::Base
  has_many :patients
  validates_length_of :name, :minimum => 2
end
