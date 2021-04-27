class ImagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @new_image = @event.images.build(image_params)

    @new_image.user = current_user

    if @new_image.save
      redirect_to @event, notice: t('controllers.photos.created')
      send_mail_to_event_subscribers(@event, @new_image)
    else
      render 'events/show', alert: t('controllers.photos.error')
    end
  end

  def destroy
    @image = Image.find(params[:id])
    message = { notice: t('controllers.photos.destroyed') }

    if current_user.creator?(@image.event)
      @image.destroy
    else
      message = { alert: t('controllers.photos.error') }
    end

    redirect_to @image.event, message
  end

  private

  def image_params
    params.fetch(:image, {}).permit(:title, :image)
  end

  def send_mail_to_event_subscribers(event, image)
    emails = event.subscribers.pluck(:email) + event.user.email - image.user.email

    emails.each do |email|
      ImageMailer.added_image(event, image, email).deliver_later
    end
  end
end
