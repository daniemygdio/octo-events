class EventsController < ApplicationController
  wrap_parameters [:json]
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
  end

  def create
    @issue = Issue.new(issue_params)
    @event = Event.new()
    @event.github_action = request.request_parameters['action']

    respond_to do |format|
      if @event.save 
        format.html { redirect_to @event, notice: 'Event was succesfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private 
    def event_params
      request.request_parameters['action']
    end

    def issue_params
      params.require(:issue).permit(:url, :number)
    end
end
