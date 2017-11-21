require "rails_helper"

RSpec.describe SavedWeathersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/saved_weathers").to route_to("saved_weathers#index")
    end

    it "routes to #new" do
      expect(:get => "/saved_weathers/new").to route_to("saved_weathers#new")
    end

    it "routes to #show" do
      expect(:get => "/saved_weathers/1").to route_to("saved_weathers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/saved_weathers/1/edit").to route_to("saved_weathers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/saved_weathers").to route_to("saved_weathers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/saved_weathers/1").to route_to("saved_weathers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/saved_weathers/1").to route_to("saved_weathers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/saved_weathers/1").to route_to("saved_weathers#destroy", :id => "1")
    end

  end
end
