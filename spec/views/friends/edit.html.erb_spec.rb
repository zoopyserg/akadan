require 'rails_helper'

RSpec.describe "friends/edit", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      name: "MyString"
    ))
  end

  it "renders the edit friend form" do
    render

    assert_select "form[action=?][method=?]", friend_path(@friend), "post" do

      assert_select "input[name=?]", "friend[name]"
    end
  end
end
