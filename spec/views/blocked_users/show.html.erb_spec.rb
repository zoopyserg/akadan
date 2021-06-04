require 'rails_helper'

RSpec.describe "blocked_users/show", type: :view do
  before(:each) do
    @blocked_user = assign(:blocked_user, BlockedUser.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
