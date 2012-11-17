require "spec_helper"

describe WikipagesController do
  describe "routing" do

    it "routes to #index" do
      get("/wikipages").should route_to("wikipages#index")
    end

    it "routes to #new" do
      get("/wikipages/new").should route_to("wikipages#new")
    end

    it "routes to #show" do
      get("/wikipages/1").should route_to("wikipages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wikipages/1/edit").should route_to("wikipages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wikipages").should route_to("wikipages#create")
    end

    it "routes to #update" do
      put("/wikipages/1").should route_to("wikipages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wikipages/1").should route_to("wikipages#destroy", :id => "1")
    end

  end
end
