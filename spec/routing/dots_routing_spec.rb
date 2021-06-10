require "rails_helper"

RSpec.describe DotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dots").to route_to("dots#index")
    end

    it "routes to #new" do
      expect(get: "/dots/new").to route_to("dots#new")
    end

    it "routes to #show" do
      expect(get: "/dots/1").to route_to("dots#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dots/1/edit").to route_to("dots#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dots").to route_to("dots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dots/1").to route_to("dots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dots/1").to route_to("dots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dots/1").to route_to("dots#destroy", id: "1")
    end
  end
end
