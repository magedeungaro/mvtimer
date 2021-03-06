class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :account_tier_type_id, :user_nickname, :email, :password, :password_confirmation,
               :current_password)
    end
  end
end
