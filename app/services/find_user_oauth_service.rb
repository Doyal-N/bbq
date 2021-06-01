# frozen_string_literal: true

class FindUserOauthService
  def self.find_user(auth)
    user = User.find_by(email: auth.info.email)

    return user if user.present?

    provider = auth.provider
    id = auth.extra.raw_info.id
    url = "https://#{provider}.com/#{id}"

    User.find_or_create_by!(url: url, provider: provider) do |user|
      user.email = auth.info.email || "example_#{id}@mail.ru"
      user.name = auth.info.name
      user.password = Devise.friendly_token.first(16)
    end
  end
end
