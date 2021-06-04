require "rails_helper"

RSpec.describe SeminarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/seminars").to route_to("seminars#index")
    end

    it "routes to #new" do
      expect(get: "/seminars/new").to route_to("seminars#new")
    end

    it "routes to #show" do
      expect(get: "/seminars/1").to route_to("seminars#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/seminars/1/edit").to route_to("seminars#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/seminars").to route_to("seminars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/seminars/1").to route_to("seminars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/seminars/1").to route_to("seminars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/seminars/1").to route_to("seminars#destroy", id: "1")
    end
  end
end
