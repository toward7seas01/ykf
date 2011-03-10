class AddDefaultValueToTotalSizeAndErrorSizeInUploadResults < ActiveRecord::Migration
  def self.up
    change_column_default :upload_results, :total_size, 0
    change_column_default :upload_results, :error_size, 0
  end

  def self.down
  end
end
