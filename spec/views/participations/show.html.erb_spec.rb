require 'rails_helper'

RSpec.describe "participations/show", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
