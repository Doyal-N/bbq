class ImageMailerPreview < ActionMailer::Preview
  def added_image
    ImageMailer.added_image(Event.find(12), Image.find(8), 'test@mail.ru')
  end
end
