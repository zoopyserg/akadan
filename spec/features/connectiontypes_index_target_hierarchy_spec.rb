require 'rails_helper'

RSpec.feature "Connection Types Index Target Hierarchy", type: :feature do
  let!(:user1) { create :user, :confirmed, :free }
  let!(:record_type) { create :record_type, name: 'My Parent Type', is_public: true }
  let!(:connection_type) { create :connection_type, target_hierarchy: hierarchy, closest_parent_type: record_type, user: user1, is_public: true }

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

  describe 'All Parent Generations' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :all_parent_generations }

      it { expect(page).to have_content 'Hierarchy of targets: All Parent Generations' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: All Parent Generations' }
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

  describe 'All Records Of Its Tree' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :all_tree_records }

      it { expect(page).to have_content 'Hierarchy of targets: All Records Of Its Tree' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: All Records Of Its Tree' }
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

  describe 'Root' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :root }

      it { expect(page).to have_content 'Hierarchy of targets: Root of the tree' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: Root of the tree' }
    end
  end

  describe 'Closest parent of type X' do
    before { visit connection_types_path }

    context 'Correct Hierarchy' do
      let(:hierarchy) { :closest_root }

      it { expect(page).to have_content 'Hierarchy of targets: Closest parent of type My Parent Type' }
    end

    context 'Different Hierarchy' do
      let(:hierarchy) { :all }

      it { expect(page).to have_no_content 'Hierarchy of targets: Closest parent of type My Parent Type' }
    end
  end
end
