require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        name: "Name"
      ),
      Notification.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
