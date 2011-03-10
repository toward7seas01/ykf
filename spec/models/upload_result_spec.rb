require 'spec_helper'

describe UploadResult do

  it '01' do
    u = build_upload_result
    u.body.path.should_not be_nil
  end

  it '02' do
    u = build_upload_result
  end

end