require "rails_helper"

RSpec.describe BlockedUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blocked_users").to route_to("blocked_users#index")
    end
  end
end
