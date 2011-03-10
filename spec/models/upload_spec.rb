require 'spec_helper'

describe Upload do
  context '01' do

    before do
      @upload_result = build_upload_result
      @upload = Upload.new(@upload_result)
    end


    it '01' do
      mock(Spreadsheet).open(anything).stub!.worksheets.stub!.each.yields([1,2,3,4,5])
      @path = @upload.handle {}
      @upload_result.total_size.should == 5
    end

    it '02' do
      mock(Spreadsheet).open(anything).stub!.worksheets {[[1,2,3,4,5]]}
      @path = @upload.handle { raise }
      @upload_result.error_size.should == 5
    end

    it '03' do
      mock(Spreadsheet).open(anything).stub!.worksheets {[[1,2,:error,4,:error]]}
      @path = @upload.handle do |row|
        if row == :error
          raise
        end
      end
      @upload_result.error_size.should == 2
    end

    it '04' do


    end

  end
end
