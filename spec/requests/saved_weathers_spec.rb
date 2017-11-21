require 'rails_helper'

RSpec.describe "SavedWeathers", type: :request do
  describe "GET /saved_weathers" do
    it "works! (now write some real specs)" do
      get saved_weathers_path
      expect(response).to have_http_status(200)
    end
  end
end
