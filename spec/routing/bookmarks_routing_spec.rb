require "rails_helper"

RSpec.describe BookmarksController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/records/1/bookmarks").to route_to("bookmarks#create", record_id: '1' )
    end

    it "routes to #destroy" do
      expect(delete: "/records/1/bookmarks/2").to route_to("bookmarks#destroy", record_id: '1', id: "2")
    end
  end
end
