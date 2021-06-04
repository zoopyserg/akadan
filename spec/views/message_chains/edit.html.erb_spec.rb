require 'rails_helper'

RSpec.describe "message_chains/edit", type: :view do
  before(:each) do
    @message_chain = assign(:message_chain, MessageChain.create!(
      name: "MyString"
    ))
  end

  it "renders the edit message_chain form" do
    render

    assert_select "form[action=?][method=?]", message_chain_path(@message_chain), "post" do

      assert_select "input[name=?]", "message_chain[name]"
    end
  end
end
