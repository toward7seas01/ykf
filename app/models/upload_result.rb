class UploadResult < ActiveRecord::Base
  has_attached_file :body
  validates_presence_of :kind


  before_create :create_error_report_path


  def create_error_report_path
    result = nil
    UploadResult.transaction do
      upload = Upload.new(self)
      result = upload.handle do |row|
        UploadResult.transaction(:requires_new => true) do
          doctor = Doctor.find_or_create_by_name(row[2])
          raise if doctor.new_record?


          patient = Patient.find_or_create_by_name_and_phone_number_and_doctor_id(row[0], row[1], doctor.id)
          raise if patient.new_record?
        end
      end
    end

    self.error_report_path = case result
    when :success
      "成功导入"
    when :error_file_type
      "错误文件格式"
    else
      result
    end
  end


end
