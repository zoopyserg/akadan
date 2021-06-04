require 'rails_helper'

RSpec.describe "message_chains/index", type: :view do
  before(:each) do
    assign(:message_chains, [
      MessageChain.create!(
        name: "Name"
      ),
      MessageChain.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of message_chains" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
