require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Event model" do
    let(:github_action) { "" }

    context "when valid parameter" do
      github_action = %w[opened closed].sample

      it "returns valid Event" do
        expect(Event.new github_action: github_action).to be_valid
      end
    end
  
    context "when invalid empty parameter" do
      it "should not create Event" do
        expect(Event.new).to_not be_valid
      end  
    end
  end
end