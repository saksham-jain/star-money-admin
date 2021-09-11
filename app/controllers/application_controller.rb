class ApplicationController < ActionController::Base
  # before_action :authenticate_client!, if: :user_site? 
  before_action :authenticate_admin_admin_user!, if: :admin_site?
  before_action :set_visitor_cookie, if: -> { user_dashboard_page? && !cron_request? }
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

  def user_dashboard_page?
    request.env['PATH_INFO'] == '/'
  end

  def cron_request?
    params[:request_type] == 'cron'
  end

  def set_visitor_cookie
    cookies.permanent[:visits] = {
      value: increment_counter
      }
  end
  
  def increment_counter
    @pageviews = cookies.permanent[:visits].to_i
    update_unique_visits_count if @pageviews == 0
    update_total_visits_count
    @pageviews += 1
  end

  def update_unique_visits_count
    Analytic.create(unique_visits: 0, total_visits: 0) unless Analytic.first.present?
    @analytic = Analytic.first
    unique_visits = @analytic.unique_visits
    @analytic.update(unique_visits: unique_visits + 1)
  end

  def update_total_visits_count
    @analytic ||= Analytic.first
    total_visits = @analytic.total_visits
    @analytic.update(total_visits: total_visits + 1)
  end
end
