class EventsController < ApplicationController
  wrap_parameters [:json]
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
  end

  def create
    @issue = Issue.find_or_create_by issue_params
    @issue.events.create event_params
    
    if @issue.save
      render json: { status: :created, location: @events }
    else
      render json: { status: :unprocessable_entity }
    end
  
  end

  def show
  end

  private 
    def event_params
      { github_action: params.require(:action) } 
    end

    def issue_params
      params.require(:issue).permit(:url, :number)
    end
end
