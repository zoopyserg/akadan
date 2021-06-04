require 'rails_helper'

RSpec.describe "seminars/show", type: :view do
  before(:each) do
    @seminar = assign(:seminar, Seminar.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
