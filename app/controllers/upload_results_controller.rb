class UploadResultsController < ApplicationController
  inherit_resources

  def create
    create! { upload_results_path }
  end
end
