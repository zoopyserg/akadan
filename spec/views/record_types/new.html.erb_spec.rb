require 'rails_helper'

RSpec.describe "record_types/new", type: :view do
  before(:each) do
    assign(:record_type, RecordType.new(
      name: "MyString"
    ))
  end

  it "renders new record_type form" do
    render

    assert_select "form[action=?][method=?]", record_types_path, "post" do

      assert_select "input[name=?]", "record_type[name]"
    end
  end
end
