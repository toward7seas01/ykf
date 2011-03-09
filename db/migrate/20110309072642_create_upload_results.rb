class CreateUploadResults < ActiveRecord::Migration
  def self.up
    create_table :upload_results do |t|
      t.string :kind
      t.string :error_report_path
      t.string :body_file_name
      t.string :body_content_type
      t.integer :body_file_size
      t.integer :total_size
      t.integer :error_size

      t.timestamps
    end
  end

  def self.down
    drop_table :upload_results
  end
end
