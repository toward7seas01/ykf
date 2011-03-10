class Upload
  def initialize(resource)
    @resource = resource
    
  end

  attr_accessor :resource

  def handle
    Spreadsheet.open(resource.body.to_file).worksheets.each do |sheet|
      begin
        sheet.each do |row|
          begin
            yield(row)
            resource.total_size += 1
          rescue => e
            resource.error_size += 1
          end
        end
      rescue => e
        resource.error_size += 1
      end
    end
    
  end
end
