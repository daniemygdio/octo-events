require 'rails_helper'

RSpec.describe Event, type: :model do
  context "when valid parameter" do
    github_action = %w[opened closed].sample
    let(:event) { Event.new github_action: github_action }
    
    it "returns correct action" do
      expect(event.github_action).to eq(github_action)
    end
  end

  context "when invalid empty parameter" do
    it "should not create Event" do
      expect(Event.create).to_not be_valid
    end  
  end
end