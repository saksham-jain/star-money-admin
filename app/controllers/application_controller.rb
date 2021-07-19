class ApplicationController < ActionController::Base
  before_action :authenticate_client!, if: :user_site? 
  before_action :authenticate_admin_admin_user!, if: :admin_site?
  layout :layout

  def layout
    admin_site? ? 'admin/layouts/admin_application' : 'user/layouts/application'
  end

  private

  def admin_site?
    request.env['PATH_INFO'].include?('/admin')
  end

  def user_site?
    !request.env['PATH_INFO'].include?('/admin')
  end
end
