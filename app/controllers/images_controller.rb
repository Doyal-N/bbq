class ImagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @new_image = @event.images.build(image_params)

    @new_image.user = current_user

    if @new_image.save
      NotifyService.send_mail_about_new_record(@new_image)
      redirect_to @event, notice: t('controllers.photos.created')
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
    params.require(:image).permit(:title, :image)
  end
end
