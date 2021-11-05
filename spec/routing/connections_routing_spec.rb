require "rails_helper"

RSpec.describe ConnectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/connections").to route_to("connections#index")
    end

    it "routes to #new" do
      expect(get: "/records/1/connection_types/2/connections/new").to route_to("connections#new", record_id: '1', connection_type_id: '2' )
    end

    it "routes to #show" do
      expect(get: "/connections/1").to route_to("connections#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/records/1/connection_types/2/connections/3/edit").to route_to("connections#edit", id: "3", record_id: '1', connection_type_id: '2' )
    end

    it "routes to #create" do
      expect(post: "/records/1/connection_types/2/connections").to route_to("connections#create", record_id: '1', connection_type_id: '2' )
    end

    it "routes to #update via PUT" do
      expect(put: "/records/1/connection_types/2/connections/3").to route_to("connections#update", id: "3", record_id: '1', connection_type_id: '2' )
    end

    it "routes to #update via PATCH" do
      expect(patch: "/records/1/connection_types/2/connections/3").to route_to("connections#update", id: "3", record_id: '1', connection_type_id: '2' )
    end
  end
end
