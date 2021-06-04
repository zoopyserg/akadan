require 'rails_helper'

RSpec.describe "blocked_users/new", type: :view do
  before(:each) do
    assign(:blocked_user, BlockedUser.new(
      name: "MyString"
    ))
  end

  it "renders new blocked_user form" do
    render

    assert_select "form[action=?][method=?]", blocked_users_path, "post" do

      assert_select "input[name=?]", "blocked_user[name]"
    end
  end
end
