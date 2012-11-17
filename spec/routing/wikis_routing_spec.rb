require "spec_helper"

describe WikisController do
  describe "routing" do

    it "routes to #index" do
      get("/wikis").should route_to("wikis#index")
    end

    it "routes to #new" do
      get("/wikis/new").should route_to("wikis#new")
    end

    it "routes to #show" do
      get("/wikis/1").should route_to("wikis#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wikis/1/edit").should route_to("wikis#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wikis").should route_to("wikis#create")
    end

    it "routes to #update" do
      put("/wikis/1").should route_to("wikis#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wikis/1").should route_to("wikis#destroy", :id => "1")
    end

  end
end
