require "rails_helper"

RSpec.describe ConversationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/conversations").to route_to("conversations#index")
    end

    it "routes to #new" do
      expect(get: "/conversations/new").to route_to("conversations#new")
    end

    it "routes to #show" do
      expect(get: "/conversations/1").to route_to("conversations#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/conversations").to route_to("conversations#create")
    end
  end
end
