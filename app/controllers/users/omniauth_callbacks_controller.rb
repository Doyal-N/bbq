# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      oauth_action('Facebook')
    end

    def vkontakte
      oauth_action('Vkontakte')
    end

    private

    def oauth_action(kind)
      @user = FindUserOauthService.find_user(request.env['omniauth.auth'])

      if @user.persisted?
        set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
        sign_in_and_redirect @user, event: :authentication
      else
        set_flash_message(:notice, :failure, kind: kind, reason: 'ошибка авторизации')
        redirect_to new_user_registration_url
      end
    end
  end
end
