require 'rails_helper'

RSpec.describe "message_chains/show", type: :view do
  before(:each) do
    @message_chain = assign(:message_chain, MessageChain.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
