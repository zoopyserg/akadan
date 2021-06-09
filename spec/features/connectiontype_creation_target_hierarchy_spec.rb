require 'rails_helper'

RSpec.feature "ConnectionTypeCreation Target Hierarchy", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_connection_type_path
    end

    context 'siblings' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_siblings
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'siblings').count
        }.by(1)
      end
    end

    context 'all_parent_generations' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_all_parent_generations
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'all_parent_generations').count
        }.by(1)
      end
    end

    context 'deep_siblings' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_deep_siblings
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'deep_siblings').count
        }.by(1)
      end
    end

    context 'all_tree_records' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_all_tree_records
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'all_tree_records').count
        }.by(1)
      end
    end

    context 'all' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_all
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'all').count
        }.by(1)
      end
    end

    context 'root' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_root
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'root').count
        }.by(1)
      end
    end

    context 'specific_parent_type' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_specific_parent_type
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'specific_parent_type').count
        }.by(1)
      end
    end

    context 'closest_root' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_hierarchy_closest_root
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_hierarchy: 'closest_root').count
        }.by(1)
      end
    end
  end
end
