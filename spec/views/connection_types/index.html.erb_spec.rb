require 'rails_helper'

RSpec.describe "connection_types/index", type: :view do
  before(:each) do
    assign(:connection_types, [
      ConnectionType.create!(
        name: "Name"
      ),
      ConnectionType.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of connection_types" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
