require "spec_helper"

describe ProductListsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_lists").should route_to("product_lists#index")
    end

    it "routes to #new" do
      get("/product_lists/new").should route_to("product_lists#new")
    end

    it "routes to #show" do
      get("/product_lists/1").should route_to("product_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_lists/1/edit").should route_to("product_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_lists").should route_to("product_lists#create")
    end

    it "routes to #update" do
      put("/product_lists/1").should route_to("product_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_lists/1").should route_to("product_lists#destroy", :id => "1")
    end

  end
end
