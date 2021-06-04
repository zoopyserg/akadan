require 'rails_helper'

RSpec.describe "connections/edit", type: :view do
  before(:each) do
    @connection = assign(:connection, Connection.create!(
      name: "MyString"
    ))
  end

  it "renders the edit connection form" do
    render

    assert_select "form[action=?][method=?]", connection_path(@connection), "post" do

      assert_select "input[name=?]", "connection[name]"
    end
  end
end
