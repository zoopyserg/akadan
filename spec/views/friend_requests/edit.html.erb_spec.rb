require 'rails_helper'

RSpec.describe "friend_requests/edit", type: :view do
  before(:each) do
    @friend_request = assign(:friend_request, FriendRequest.create!(
      name: "MyString"
    ))
  end

  it "renders the edit friend_request form" do
    render

    assert_select "form[action=?][method=?]", friend_request_path(@friend_request), "post" do

      assert_select "input[name=?]", "friend_request[name]"
    end
  end
end
