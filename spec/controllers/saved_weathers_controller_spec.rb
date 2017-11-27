# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SavedWeathersController, type: :controller do
  let(:user){ create(:user) }

  before(:all) { Warden.test_reset! }
  before(:each) { Warden.test_reset! }

  describe 'get #index' do
    it 'returns http success' do
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'create weather' do
    it 'create weather' do
      sign_in(user)
      expect { post :create, params: {saved_weather: {location: "Kiev"}}, format: :js }.to change(SavedWeather, :count).by(1)
    end
  end

  describe 'delete weather' do
    it 'delete and render to index partial' do
      sign_in(user)
      saved_weather = create(:saved_weather, user: user)
      expect { delete :destroy, params: {id: saved_weather.id}, format: :js }.to change(SavedWeather, :count).by(-1)
    end
  end
end
