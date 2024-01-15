require "rails_helper"

RSpec.describe ParticipationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/conversations/1/participations").to route_to("participations#index", conversation_id: '1')
    end

    it "routes to #new" do
      expect(get: "/conversations/1/participations/new").to route_to("participations#new", conversation_id: '1')
    end

    it "routes to #create" do
      expect(post: "/conversations/1/participations").to route_to("participations#create", conversation_id: '1')
    end

    it "routes to #destroy" do
      expect(delete: "/conversations/1/participations/2").to route_to("participations#destroy", id: "2", conversation_id: '1')
    end
  end
end
