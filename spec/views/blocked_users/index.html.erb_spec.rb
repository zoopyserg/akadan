require 'rails_helper'

RSpec.describe "blocked_users/index", type: :view do
  before(:each) do
    assign(:blocked_users, [
      BlockedUser.create!(
        name: "Name"
      ),
      BlockedUser.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of blocked_users" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
