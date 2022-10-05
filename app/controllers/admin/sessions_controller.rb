# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
#before_action :configure_sign_in_params, only: [:create]

#Vbefore_action :configure_permitted_parameters , if: :devise_controller?

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # def destroy
  #   reset_session
  #   redirect_to new_admin_session_path
  # end

  protected

  def after_sign_in_path_for(resource)
    admin_top_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def configure_permitted_parameters
   	  # devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :encrypted_password])
  # end
# end