module UploadResultsHelper
  def error_report_link(upload_result)
    if upload_result.error_report_path =~ /data/
      link_to "错误报道", "/data/" + File.basename(upload_result.error_report_path)
    else
      upload_result.error_report_path
    end
  end
end
