class Upload
  def initialize(resource)
    @resource = resource
    @errors = ActiveSupport::OrderedHash.new
  end

  attr_accessor :resource

  def handle
    Spreadsheet.open(resource.body.to_file).worksheets.each do |sheet|
      begin
        sheet.each do |row|
          begin
            yield(row)
          rescue => e
            @errors[e.message] = row
            resource.error_size += 1
          ensure
            resource.total_size += 1
          end
        end
      rescue => e
        resource.error_size += 1
      end
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
