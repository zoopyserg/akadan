require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        name: "Name"
      ),
      Message.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
