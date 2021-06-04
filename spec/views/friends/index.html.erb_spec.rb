require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        name: "Name"
      ),
      Friend.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
