require 'rails_helper'

RSpec.describe "dots/new", type: :view do
  before(:each) do
    assign(:dot, Dot.new(
      record: nil,
      income: "9.99"
    ))
  end

  it "renders new dot form" do
    render

    assert_select "form[action=?][method=?]", dots_path, "post" do

      assert_select "input[name=?]", "dot[record_id]"

      assert_select "input[name=?]", "dot[income]"
    end
  end
end
