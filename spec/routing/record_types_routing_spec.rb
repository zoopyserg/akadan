require "rails_helper"

RSpec.describe RecordTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/record_types").to route_to("record_types#index")
    end

    it "routes to #new" do
      expect(get: "/record_types/new").to route_to("record_types#new")
    end

    # it "routes to #show" do
    #   expect(get: "/record_types/1").to route_to("record_types#show", id: "1")
    # end

    it "routes to #edit" do
      expect(get: "/record_types/1/edit").to route_to("record_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/record_types").to route_to("record_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/record_types/1").to route_to("record_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/record_types/1").to route_to("record_types#update", id: "1")
    end
  end
end
