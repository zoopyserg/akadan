require 'rails_helper'

RSpec.describe "dots/index", type: :view do
  before(:each) do
    assign(:dots, [
      Dot.create!(
        record: nil,
        income: "9.99"
      ),
      Dot.create!(
        record: nil,
        income: "9.99"
      )
    ])
  end

  it "renders a list of dots" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
