require 'rails_helper'

RSpec.describe "connection_types/edit", type: :view do
  before(:each) do
    @connection_type = assign(:connection_type, ConnectionType.create!(
      name: "MyString"
    ))
  end

  it "renders the edit connection_type form" do
    render

    assert_select "form[action=?][method=?]", connection_type_path(@connection_type), "post" do

      assert_select "input[name=?]", "connection_type[name]"
    end
  end
end
