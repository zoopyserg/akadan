require 'rails_helper'

RSpec.describe "friend_requests/show", type: :view do
  before(:each) do
    @friend_request = assign(:friend_request, FriendRequest.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
