require 'rails_helper'

RSpec.feature "Connection Types Index Target Hierarchy", type: :feature do
  let!(:user1) { create :user, :confirmed, :free }
  let!(:record_type) { create :record_type, name: 'My Parent Type', is_public: true }
  let!(:connection_type) { create :connection_type, target_hierarchy: hierarchy, closest_parent_type: record_type, user: user1, is_public: true }

  before { ConnectionType.where.not(id: [connection_type.id]).destroy_all }

  describe 'Siblings' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :siblings }

      it { expect(page).to have_content 'Hierarchy of targets: Siblings' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: Siblings' }
    end
  end

  describe 'Deep Siblings' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :deep_siblings }

      it { expect(page).to have_content 'Hierarchy of targets: Deep Siblings' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: Deep Siblings' }
    end
  end

  describe 'All' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_content 'Hierarchy of targets: All Records' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :siblings }

      it { expect(page).to have_no_content 'Hierarchy of targets: All Records' }
    end
  end

  describe 'Roots of all trees' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :all_roots }

      it { expect(page).to have_content 'Hierarchy of targets: Roots of all trees' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: Roots of all trees' }
    end
  end

end
