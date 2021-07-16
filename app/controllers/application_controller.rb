class ApplicationController < ActionController::Base
  before_action :authenticate_admin_admin_user!
  layout :layout

  def layout
    current_uri = request.env['PATH_INFO']
    current_uri.include?('/admin') ? 'admin_application' : 'application'
  end
end
