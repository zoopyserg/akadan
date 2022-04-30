require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  let!(:user) { create(:user) }
  let!(:record) { create(:record) }
  let!(:comment) { create(:comment, user: user, commentable: record) }

  describe "routing" do
    it "routes to #new" do
      expect(get: "/records/#{record.id}/comments/new").to route_to("comments#new", record_id: record.id.to_s)
    end

    it "routes to #new" do
      expect(get: "/comments/#{comment.id}/comments/new").to route_to("comments#new", comment_id: comment.id.to_s)
    end

    it "routes to #create" do
      expect(post: "/records/#{record.id}/comments").to route_to("comments#create", record_id: record.id.to_s)
    end

    it "routes to #create" do
      expect(post: "/comments/#{record.id}/comments").to route_to("comments#create", comment_id: comment.id.to_s)
    end
  end
end
