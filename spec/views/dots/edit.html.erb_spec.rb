require 'rails_helper'

RSpec.describe "dots/edit", type: :view do
  before(:each) do
    @dot = assign(:dot, Dot.create!(
      record: nil,
      income: "9.99"
    ))
  end

  it "renders the edit dot form" do
    render

    assert_select "form[action=?][method=?]", dot_path(@dot), "post" do

      assert_select "input[name=?]", "dot[record_id]"

      assert_select "input[name=?]", "dot[income]"
    end
  end
end
