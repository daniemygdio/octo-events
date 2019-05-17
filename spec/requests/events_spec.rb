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
      let(:valid_params) { 
        {
          github_action: %w[opened closed].sample,
          issue: {
            url: FFaker::Internet.http_url,
            number: FFaker::Random.rand(100..999)
          }
        }
      }

      it "creates successfully" do
        post events_path, params: valid_params
        
        expect(response).to have_http_status(200)
      end
    end
  end
end
