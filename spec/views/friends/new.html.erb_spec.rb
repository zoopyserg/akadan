require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      name: "MyString"
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input[name=?]", "friend[name]"
    end
  end
end
