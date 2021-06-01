# frozen_string_literal: true

module UsersHelper
  def user_helper_avatar(user)
    if user.avatar.attached?
      image_tag url_for(user.avatar), class: 'is-rounded'
    else
      image_pack_tag('ava.jpg', class: 'is-rounded')
    end
  end
end
