require "rails_helper"

RSpec.describe MessagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/conversations/1/messages").to route_to("messages#index", conversation_id: '1')
    end

    it "routes to #create" do
      expect(post: "/conversations/1/messages").to route_to("messages#create", conversation_id: '1')
    end
  end
end
