require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      title: "MyString",
      body: "MyText",
      subject: "MyString",
      commentable_id: 1,
      commentable_type: "MyString",
      user_id: 1,
      parent_id: 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[title]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[subject]"

      assert_select "input[name=?]", "comment[commentable_id]"

      assert_select "input[name=?]", "comment[commentable_type]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[parent_id]"
    end
  end
end
