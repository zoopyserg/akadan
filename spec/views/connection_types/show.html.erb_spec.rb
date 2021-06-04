require 'rails_helper'

RSpec.describe "connection_types/show", type: :view do
  before(:each) do
    @connection_type = assign(:connection_type, ConnectionType.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
