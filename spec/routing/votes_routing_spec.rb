require "rails_helper"

RSpec.describe VotesController, type: :routing do
  let!(:user) { create(:user) }
  let!(:comment) { create :comment }

  describe "routing" do
    it "routes to #create" do
      expect(post: "/comments/#{comment.id}/votes").to route_to("votes#create", comment_id: comment.id.to_s)
    end
  end
end
