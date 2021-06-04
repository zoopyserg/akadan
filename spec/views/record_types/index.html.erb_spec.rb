require 'rails_helper'

RSpec.describe "record_types/index", type: :view do
  before(:each) do
    assign(:record_types, [
      RecordType.create!(
        name: "Name"
      ),
      RecordType.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of record_types" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
