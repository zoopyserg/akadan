require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      title: "Title",
      body: "MyText",
      subject: "Subject",
      commentable_id: 2,
      commentable_type: "Commentable Type",
      user_id: 3,
      parent_id: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Commentable Type/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
