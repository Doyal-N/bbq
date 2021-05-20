class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, except: %i[index]
  before_action :password_guard!, only: [:show]
  after_action :verify_authorized, only: %i[edit update destroy show]

  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
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

  def password_guard!
    input_pin = params[:pincode]

    if @event.true_pincode?(input_pin)
      cookies.permanent["event_#{@event.id}_pincode"] = input_pin
    end

    pincode = cookies["event_#{@event.id}_pincode"]

    unless @event.true_pincode?(pincode)
      if input_pin.present?
        flash.now[:alert] = t('controllers.events.wrong_pincode')
      end
      render 'password_form'
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :address, :pincode, :datetime)
  end
end
