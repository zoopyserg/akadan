require 'rails_helper'

RSpec.describe "connections/show", type: :view do
  before(:each) do
    @connection = assign(:connection, Connection.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
