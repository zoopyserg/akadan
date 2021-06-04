require "rails_helper"

RSpec.describe BlockedUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blocked_users").to route_to("blocked_users#index")
    end

    it "routes to #new" do
      expect(get: "/blocked_users/new").to route_to("blocked_users#new")
    end

    it "routes to #show" do
      expect(get: "/blocked_users/1").to route_to("blocked_users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blocked_users/1/edit").to route_to("blocked_users#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blocked_users").to route_to("blocked_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blocked_users/1").to route_to("blocked_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blocked_users/1").to route_to("blocked_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blocked_users/1").to route_to("blocked_users#destroy", id: "1")
    end
  end
end
