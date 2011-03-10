require 'spec_helper'

describe UploadResult do

  before do
    @upload_result = build_upload_result
    @upload = Upload.new(@upload_result)
  end

  it '00' do
    File.directory?("#{Rails.root}/public/data").should be_true
  end

  it '01' do
    mock(Spreadsheet).open(anything).stub!.worksheets {[[["cool", "123456", "y"], ["cool", "123456", "done"]]]}
    @upload_result.save!

    Patient.all.should have(1).patient
    Doctor.all.should have(1).doctor

    Patient.all[0].doctor.name.should == "done"
  end

  it '02' do
    mock(Spreadsheet).open(anything).stub!.worksheets {[[["cool", "123456", "y"], ["cool", "123456", "done"]]]}
    @upload_result.save!

    @upload_result.error_report_path.should =~ /public/
  end

  it '03' do
    @upload_result.save!

    @upload_result.total_size.should == 5
    @upload_result.error_report_path.should == "成功导入"
  end

end