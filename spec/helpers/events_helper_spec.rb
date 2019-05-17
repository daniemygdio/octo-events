require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  describe "number_of_events_by_action" do
    context "when there are events available" do
      let(:github_action_opened) { "opened" }

      before do
        Event.create({ github_action: github_action_opened })
        Event.create({ github_action: github_action_opened })
      end

      it "should return the number of events per action" do
        expect(number_of_events_by_action(Event.all)[github_action_opened]).to eq(2)
      end
    end

    context "when there are no events available" do
      it "should return nil" do
        expect(number_of_events_by_action(Event.all)).to be_empty
      end
    end
  end
end
