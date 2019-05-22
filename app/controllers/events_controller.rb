class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
  end

  def create
    @issue = Issue.find_or_initialize_by issue_params
    @issue.events.build event_params
    
    if @issue.save
      render json: { status: :created }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private 
    def event_params
      { github_action: request.request_parameters['action'] } 
    end

    def issue_params
      params.require(:issue).permit(:url, :number)
    end
end
