require 'rails_helper'

RSpec.describe "dots/show", type: :view do
  before(:each) do
    @dot = assign(:dot, Dot.create!(
      record: nil,
      income: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
