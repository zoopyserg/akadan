require 'rails_helper'

RSpec.describe "record_types/edit", type: :view do
  before(:each) do
    @record_type = assign(:record_type, RecordType.create!(
      name: "MyString"
    ))
  end

  it "renders the edit record_type form" do
    render

    assert_select "form[action=?][method=?]", record_type_path(@record_type), "post" do

      assert_select "input[name=?]", "record_type[name]"
    end
  end
end
