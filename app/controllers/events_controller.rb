# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, except: %i[index new create]
  after_action :verify_authorized, only: %i[edit update destroy show new create]

  def index
    @events = policy_scope(Event)
  end

  def show
    if params[:pincode].present? && @event.true_pincode?(params[:pincode])
      cookies.permanent["event_#{@event.id}_pincode"] = params[:pincode]
    end

    authorize @event
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])

  rescue Pundit::NotAuthorizedError
    flash.now[:alert] = t('pundit.wrong_pincode') if params[:pincode].present?
    render 'password_form'
  end

  def new
    @event = current_user.events.build
    authorize @event
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)
    authorize @event

    if @event.save
      redirect_to @event, notice: t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_url, notice: t('controllers.events.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :address, :pincode, :datetime)
  end
end
