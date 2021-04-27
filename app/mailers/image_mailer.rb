class ImageMailer < ApplicationMailer
  def added_image(event, image, email)
    @event = event
    @image = image.image
    @user = image.user

    mail to: email, subject: "Новое фото на событие - #{event.title}"
  end
end
