module UploadResultsHelper
  def error_report_url(upload_result)
    if upload_result.error_report_path.is_a?(String)
      upload_result.error_report_path
    else
      link_to "错误报道", upload_result.error_report_path
    end
  end
end
