require 'rails_helper'

RSpec.describe "seminars/new", type: :view do
  before(:each) do
    assign(:seminar, Seminar.new(
      name: "MyString"
    ))
  end

  it "renders new seminar form" do
    render

    assert_select "form[action=?][method=?]", seminars_path, "post" do

      assert_select "input[name=?]", "seminar[name]"
    end
  end
end
