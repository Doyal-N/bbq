# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
