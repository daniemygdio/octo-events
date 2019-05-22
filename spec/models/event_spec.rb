require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Event model" do
    let(:github_action) { "" }

    context "when valid parameter" do
      github_action = %w[opened closed].sample

      it { expect(Event.new github_action: github_action).to be_valid }
    end
  
    context "when invalid empty parameter" do
      it { expect(Event.new).to_not be_valid }
    end
  end
end