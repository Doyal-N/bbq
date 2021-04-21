class SubscriptionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if !current_user&.creator?(@event)
      @new_subscription.save
      redirect_to @event, notice: t('controllers.subscriptions.created')
    else
      render 'events/show', alert: t('controllers.subscriptions.error')
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    message = { notice: t('controllers.subscriptions.destroyed') }

    if current_user_can_edit?(@subscription)
      @subscription.destroy!
    else
      message = { alert: t('controllers.subscriptions.error') }
    end

    redirect_to @subscription.event, message
  end

  private

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
