require 'rails_helper'

RSpec.describe "sensors/new", type: :view do
  before(:each) do
    assign(:sensor, Sensor.new(
      name: "MyString"
    ))
  end

  it "renders new sensor form" do
    render

    assert_select "form[action=?][method=?]", sensors_path, "post" do

      assert_select "input[name=?]", "sensor[name]"
    end
  end
end
