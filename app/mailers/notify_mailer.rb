class NotifyMailer < ApplicationMailer
  def added_image(event, image, email)
    @event = event
    @image = image.image
    @user = image.user

    mail to: email, subject: default_i18n_subject(event: event.title)
  end

  def added_comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: default_i18n_subject(event: event.title)
  end
end
