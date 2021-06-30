require 'rails_helper'

RSpec.feature "Connection Types Index Target Types", type: :feature do
  let!(:user1) { create :user, :confirmed, :free }
  let!(:record_type) { create :record_type, name: 'Very Cool Type' }
  let!(:record_subtype) { create :record_type, name: 'Some even cooler subtype' }

  let!(:connection_type) { create :connection_type, target_type: type, target_record_type: record_type, target_record_subtype: record_subtype, user: user1, is_public: true }

  describe 'Any Type' do
    before { visit connection_types_path }

    context 'Any are targets' do
      let(:type) { :any }

      it { expect(page).to have_content 'Type of targets: Any' }
    end

    context 'Not Any are targets' do
      let(:type) { :same_as_source }

      it { expect(page).to have_no_content 'Type of targets: Any' }
    end
  end

  describe 'Same As Source' do
    before { visit connection_types_path }

    context 'Targets are same as source' do
      let(:type) { :same_as_source }

      it { expect(page).to have_content 'Type of targets: Same as source' }
    end

    context 'Targets are different than source' do
      let(:type) { :any }

      it { expect(page).to have_no_content 'Type of targets: Same as source' }
    end
  end

  describe 'Specific Type' do
    before { visit connection_types_path }

    context 'Any are targets' do
      let(:type) { :any }

      it { expect(page).to have_no_content 'Type of targets: Very Cool Type' }
    end

    context 'Targets are same as source' do
      let(:type) { :same_as_source }

      it { expect(page).to have_no_content 'Type of targets: Very Cool Type' }
    end
  end

  describe 'Specific SubType' do
    before { visit connection_types_path }

    context 'Any are targets' do
      let(:type) { :any }

      it { expect(page).to have_no_content 'Type of targets: Some even cooler subtype under the records of type Very Cool Type' }
    end

    context 'Targets are same as source' do
      let(:type) { :same_as_source }

      it { expect(page).to have_no_content 'Type of targets: Some even cooler subtype under the records of type Very Cool Type' }
    end

    context 'Targets are of that specific type' do
      let(:type) { :specific_type }

      it { expect(page).to have_no_content 'Type of targets: Some even cooler subtype under the records of type Very Cool Type' }
    end

    context 'Targets are of that specific type' do
      let(:type) { :specific_subtype }

      it { expect(page).to have_content 'Type of targets: Some even cooler subtype under the records of type Very Cool Type' }
    end
  end
end
