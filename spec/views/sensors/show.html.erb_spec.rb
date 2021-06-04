require 'rails_helper'

RSpec.describe "sensors/show", type: :view do
  before(:each) do
    @sensor = assign(:sensor, Sensor.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
