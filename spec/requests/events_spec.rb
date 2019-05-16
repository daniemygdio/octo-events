require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "works! (now write some real specs)" do
      get events_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /events" do
    context "when valid parameters" do
      github_action = %w[opened closed].sample
      
      it "creates successfully" do
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/events", :params => '{ action: github_action, issue: { url: "fake.url", number: 123 } }', :headers => headers

        expect(response).to have_http_status(:created)
      end
    end
  end
end
