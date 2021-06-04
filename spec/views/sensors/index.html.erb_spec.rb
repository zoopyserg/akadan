require 'rails_helper'

RSpec.describe "sensors/index", type: :view do
  before(:each) do
    assign(:sensors, [
      Sensor.create!(
        name: "Name"
      ),
      Sensor.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of sensors" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
