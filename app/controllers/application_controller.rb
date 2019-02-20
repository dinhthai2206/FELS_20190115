class ApplicationController < ActionController::Base
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def full_title page_title = ""
    base_title = "FELS"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
