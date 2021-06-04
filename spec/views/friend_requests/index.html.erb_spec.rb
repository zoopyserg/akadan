require 'rails_helper'

RSpec.describe "friend_requests/index", type: :view do
  before(:each) do
    assign(:friend_requests, [
      FriendRequest.create!(
        name: "Name"
      ),
      FriendRequest.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of friend_requests" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
