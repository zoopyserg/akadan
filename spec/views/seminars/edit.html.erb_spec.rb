require 'rails_helper'

RSpec.describe "seminars/edit", type: :view do
  before(:each) do
    @seminar = assign(:seminar, Seminar.create!(
      name: "MyString"
    ))
  end

  it "renders the edit seminar form" do
    render

    assert_select "form[action=?][method=?]", seminar_path(@seminar), "post" do

      assert_select "input[name=?]", "seminar[name]"
    end
  end
end
