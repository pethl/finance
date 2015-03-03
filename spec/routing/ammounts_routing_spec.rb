require "spec_helper"

describe AmmountsController do
  describe "routing" do

    it "routes to #index" do
      get("/ammounts").should route_to("ammounts#index")
    end

    it "routes to #new" do
      get("/ammounts/new").should route_to("ammounts#new")
    end

    it "routes to #show" do
      get("/ammounts/1").should route_to("ammounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ammounts/1/edit").should route_to("ammounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ammounts").should route_to("ammounts#create")
    end

    it "routes to #update" do
      put("/ammounts/1").should route_to("ammounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ammounts/1").should route_to("ammounts#destroy", :id => "1")
    end

  end
end
