class NotifyService
  def send_mail_about_new_image(event, image)
    emails = event.subscribers.pluck(:email) + event.user.email - image.user.email

    emails.each do |email|
      NotifyMailer.added_image(event, image, email).deliver_now
    end
  end

  def send_mail_about_new_comment(event, comment)
    emails = event.subscribers.pluck(:email) + event.user.email - comment.user.email

    emails.each do |email|
      NotifyMailer.added_comment(event, comment, email).deliver_now
    end
  end
end
