require 'rails_helper'

RSpec.describe "connections/index", type: :view do
  before(:each) do
    assign(:connections, [
      Connection.create!(
        name: "Name"
      ),
      Connection.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of connections" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
