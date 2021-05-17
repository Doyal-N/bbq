class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name email password password_confirmation]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? && (model.user == current_user ||
      (model.try(:event).present? && model.event.user == current_user))
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
