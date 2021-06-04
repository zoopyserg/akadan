require 'rails_helper'

RSpec.describe "friend_requests/new", type: :view do
  before(:each) do
    assign(:friend_request, FriendRequest.new(
      name: "MyString"
    ))
  end

  it "renders new friend_request form" do
    render

    assert_select "form[action=?][method=?]", friend_requests_path, "post" do

      assert_select "input[name=?]", "friend_request[name]"
    end
  end
end
