require 'rails_helper'

RSpec.describe "seminars/index", type: :view do
  before(:each) do
    assign(:seminars, [
      Seminar.create!(
        name: "Name"
      ),
      Seminar.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of seminars" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
