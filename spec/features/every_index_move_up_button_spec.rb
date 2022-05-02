require 'rails_helper'

RSpec.feature "Connection Types Index Target Types", type: :feature do
  after { expect(page).to have_css '.back-to-top', visible: false }

  it { visit connections_path }
  it { visit connection_types_path }
  it { visit record_types_path }
  it { visit records_path }
  it { visit sensors_path }
end
