require "spec_helper"

describe FuturesController do
  describe "routing" do

    it "routes to #index" do
      get("/futures").should route_to("futures#index")
    end

    it "routes to #new" do
      get("/futures/new").should route_to("futures#new")
    end

    it "routes to #show" do
      get("/futures/1").should route_to("futures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/futures/1/edit").should route_to("futures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/futures").should route_to("futures#create")
    end

    it "routes to #update" do
      put("/futures/1").should route_to("futures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/futures/1").should route_to("futures#destroy", :id => "1")
    end

  end
end
