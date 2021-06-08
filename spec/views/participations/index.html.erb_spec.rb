require 'rails_helper'

RSpec.describe "participations/index", type: :view do
  before(:each) do
    assign(:participations, [
      Participation.create!(),
      Participation.create!()
    ])
  end

  it "renders a list of participations" do
    render
  end
end
