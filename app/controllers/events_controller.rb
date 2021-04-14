class EventsController < ApplicationController
  before_action :set_user, only: %i[index new create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = @user.events
  end

  def show
  end

  def new
    @event = @user.events.build
  end

  def edit
  end

  def create
    @event = @user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :address, :datetime)
    end
end
