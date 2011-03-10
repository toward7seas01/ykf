class UploadResult < ActiveRecord::Base
  has_attached_file :body
  validates_presence_of :kind


  before_create :create_error_report_path


  def create_error_report_path
 
  end


end
