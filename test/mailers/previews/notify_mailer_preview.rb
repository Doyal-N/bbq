class NotifyMailerPreview < ActionMailer::Preview
  def added_image
    NotifyMailer.added_image(Image.find(8), 'test@mail.ru')
  end

  def added_comment
    NotifyMailer.added_comment(Comment.first, 'test@mail.ru')
  end
end
