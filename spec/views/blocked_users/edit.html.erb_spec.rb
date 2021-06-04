require 'rails_helper'

RSpec.describe "blocked_users/edit", type: :view do
  before(:each) do
    @blocked_user = assign(:blocked_user, BlockedUser.create!(
      name: "MyString"
    ))
  end

  it "renders the edit blocked_user form" do
    render

    assert_select "form[action=?][method=?]", blocked_user_path(@blocked_user), "post" do

      assert_select "input[name=?]", "blocked_user[name]"
    end
  end
end
