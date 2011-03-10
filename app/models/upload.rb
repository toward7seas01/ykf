class Upload
  def initialize(resource)
    @resource = resource
    @errors = ActiveSupport::OrderedHash.new
  end

  attr_accessor :resource

  def handle
    begin
      Spreadsheet.open(resource.body.to_file).worksheets.each do |sheet|
        sheet.each_with_index do |row, i|
          begin
            yield(row)
          rescue => e
            @errors[i + 1] = [e.message] + Array(row).map(&:to_s)
            resource.error_size += 1
          ensure
            resource.total_size += 1
          end
        end
      end
    rescue => e
      resource.error_size = 0
      resource.total_size = 0
      return :error_file_type
    end

    if @errors.size == 0
      :success
    else
      generate_error_report
    end
    
  end

  private

  def generate_error_report
    report = Report.new([""], @errors)
    report.write
  end
end
