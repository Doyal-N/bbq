class FindUserOauthService
  def self.find_user(auth)
    user = User.where(email: auth.info.email).first

    return user if user.present?

    provider = auth.provider
    id = auth.extra.raw_info.id
    url = "https://#{provider}.com/#{id}"

    User.where(url: url, provider: provider).first_or_create! do |user|
      user.email = auth.info.email || 'example@mail.ru'
      user.name = auth.info.name
      user.password = Devise.friendly_token.first(16)
    end
  end
end
