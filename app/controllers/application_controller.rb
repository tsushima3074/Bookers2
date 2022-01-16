class ApplicationController < ActionController::Base

  before_action :authenticate_user!, if: :use_auth?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def use_auth?
    unless controller_name == 'homes'
      true
    end
  end
end
