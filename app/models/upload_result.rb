class UploadResult < ActiveRecord::Base
  has_attached_file :body
end
