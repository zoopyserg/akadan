require "rails_helper"

RSpec.describe MessageChainsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/message_chains").to route_to("message_chains#index")
    end

    it "routes to #new" do
      expect(get: "/message_chains/new").to route_to("message_chains#new")
    end

    it "routes to #show" do
      expect(get: "/message_chains/1").to route_to("message_chains#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/message_chains/1/edit").to route_to("message_chains#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/message_chains").to route_to("message_chains#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/message_chains/1").to route_to("message_chains#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/message_chains/1").to route_to("message_chains#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/message_chains/1").to route_to("message_chains#destroy", id: "1")
    end
  end
end
