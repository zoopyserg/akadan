require "rails_helper"

RSpec.describe ConnectionTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/connection_types").to route_to("connection_types#index")
    end

    it "routes to #new" do
      expect(get: "/connection_types/new").to route_to("connection_types#new")
    end

    # it "routes to #show" do
    #   expect(get: "/connection_types/1").to route_to("connection_types#show", id: "1")
    # end

    it "routes to #edit" do
      expect(get: "/connection_types/1/edit").to route_to("connection_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/connection_types").to route_to("connection_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/connection_types/1").to route_to("connection_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/connection_types/1").to route_to("connection_types#update", id: "1")
    end
  end
end
