require "rails_helper"

RSpec.describe DotsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/records/1/dots/new").to route_to("dots#new", record_id: '1')
    end

    it "routes to #create" do
      expect(post: "/records/1/dots").to route_to("dots#create", record_id: '1')
    end
  end
end
