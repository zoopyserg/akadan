require "rails_helper"

RSpec.describe FriendRequestsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/friends/1/friend_requests").to route_to("friend_requests#create", friend_id: '1')
    end

    it "routes to #accept" do
      expect(post: "/friends/1/friend_requests/accept").to route_to("friend_requests#accept", friend_id: '1')
    end

    it "routes to #reject" do
      expect(delete: "/friends/1/friend_requests/reject").to route_to("friend_requests#reject", friend_id: '1')
    end

    it "routes to #unfriend" do
      expect(delete: "/friends/1/friend_requests/unfriend").to route_to("friend_requests#unfriend", friend_id: '1')
    end
  end
end
