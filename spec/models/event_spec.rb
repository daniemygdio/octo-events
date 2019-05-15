require 'rails_helper'

RSpec.describe Event, type: :model do
  it "should create an event succesfully" do
    event = Event.new
    event.github_action = "open"

    expect(event.github_action).to eq("open")
  end
end
