require 'rails_helper'

RSpec.describe "connection_types/new", type: :view do
  before(:each) do
    assign(:connection_type, ConnectionType.new(
      name: "MyString"
    ))
  end

  it "renders new connection_type form" do
    render

    assert_select "form[action=?][method=?]", connection_types_path, "post" do

      assert_select "input[name=?]", "connection_type[name]"
    end
  end
end
