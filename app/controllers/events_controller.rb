class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event was saved!"
      redirect_to @event
    else
      flash[:error] = "Event wasn't saved."
      render :new
    end
  end

  def edit
    @event = Event.find(event_params)
  end
   
  private

  def event_params
    params.require(:event).permit(:title, :description)
  end

end
