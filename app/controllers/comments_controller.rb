class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @event, notice: t('controllers.comments.created')
      NotifyService.send_mail_about_new_comment(@event, @new_comment)
    else
      render 'events/show', alert: t('controllers.comments.error')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    message = {notice: t('controllers.comments.destroyed')}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: t('controllers.comments.error')}
    end

    redirect_to @comment.event, message
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
