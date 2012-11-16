require "spec_helper"

describe OminusersController do
  describe "routing" do

    it "routes to #index" do
      get("/ominusers").should route_to("ominusers#index")
    end

    it "routes to #new" do
      get("/ominusers/new").should route_to("ominusers#new")
    end

    it "routes to #show" do
      get("/ominusers/1").should route_to("ominusers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ominusers/1/edit").should route_to("ominusers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ominusers").should route_to("ominusers#create")
    end

    it "routes to #update" do
      put("/ominusers/1").should route_to("ominusers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ominusers/1").should route_to("ominusers#destroy", :id => "1")
    end

  end
end
