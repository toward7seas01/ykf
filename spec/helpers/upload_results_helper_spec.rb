require 'spec_helper'

describe UploadResultsHelper do
  it '01' do
    mock(Spreadsheet).open(anything).stub!.worksheets {[[["cool", "123456", "y"], ["cool", "123456", "done"]]]}
    upload_result = build_upload_result
    upload_result.save

    helper.error_report_link(upload_result).should =~ /data/
  end

  it '02' do
    mock(Spreadsheet).open(anything).stub!.worksheets {[[["cool", "123456", "done"]]]}
    upload_result = build_upload_result
    upload_result.save

    helper.error_report_link(upload_result).should_not =~ /data/
  end
end
