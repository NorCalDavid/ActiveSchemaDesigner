require "rails_helper"

RSpec.describe TablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tables").to route_to("tables#index")
    end

    it "routes to #new" do
      expect(:get => "/tables/new").to route_to("tables#new")
    end

    it "routes to #show" do
      expect(:get => "/tables/1").to route_to("tables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tables/1/edit").to route_to("tables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tables").to route_to("tables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tables/1").to route_to("tables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tables/1").to route_to("tables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tables/1").to route_to("tables#destroy", :id => "1")
    end

  end
end
