require "rails_helper"

RSpec.describe GroupsController, type: :routing do
  describe "routing" do
    it "routes to #edit" do
      expect(get: "/groups/1/edit").to route_to("groups#edit", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/groups/1").to route_to("groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/groups/1").to route_to("groups#update", id: "1")
    end
  end
end
