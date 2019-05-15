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
    
    if @issue.save && @event.save
      render json: { status: :created, location: @events }
    else
      render json: { status: :unprocessable_entity }
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
