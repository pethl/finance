require "spec_helper"

describe InvtypesController do
  describe "routing" do

    it "routes to #index" do
      get("/invtypes").should route_to("invtypes#index")
    end

    it "routes to #new" do
      get("/invtypes/new").should route_to("invtypes#new")
    end

    it "routes to #show" do
      get("/invtypes/1").should route_to("invtypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/invtypes/1/edit").should route_to("invtypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/invtypes").should route_to("invtypes#create")
    end

    it "routes to #update" do
      put("/invtypes/1").should route_to("invtypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/invtypes/1").should route_to("invtypes#destroy", :id => "1")
    end

  end
end
