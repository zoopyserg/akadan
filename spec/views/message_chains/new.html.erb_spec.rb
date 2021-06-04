require 'rails_helper'

RSpec.describe "message_chains/new", type: :view do
  before(:each) do
    assign(:message_chain, MessageChain.new(
      name: "MyString"
    ))
  end

  it "renders new message_chain form" do
    render

    assert_select "form[action=?][method=?]", message_chains_path, "post" do

      assert_select "input[name=?]", "message_chain[name]"
    end
  end
end
