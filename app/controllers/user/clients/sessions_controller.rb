# frozen_string_literal: true

class User::Clients::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  # POST /resource/sign_in
  def create
    client = Client.find_by(reliance_client_code: params[:client][:reliance_client_code])
    redirect_to new_client_session_path, flash: { warning: 'Please enter valid Client Id' } and return unless client

    unless Client.find_by(reliance_client_code: params[:client][:reliance_client_code]).activated?
      flash[:warning] = 'You have not signed up. Please SignUp before login'
      redirect_to new_client_session_path and return
    end
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
