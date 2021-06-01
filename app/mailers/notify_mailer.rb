# frozen_string_literal: true

class NotifyMailer < ApplicationMailer
  def added_image(image, email)
    @event = image.event
    @image = image.image
    @user = image.user

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end

  def added_comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end
end
