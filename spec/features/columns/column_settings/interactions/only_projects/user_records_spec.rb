require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }

  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true, separate_project: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true, separate_project: false }

  let!(:design1) { create :design, user: user1, is_public: false, designable: user1 }
  let!(:design2) { create :design, user: user2, is_public: false, designable: user1 }

  context 'not signed in' do
    context 'only_separate' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
    end

    context 'all' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'only_separate' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
    end

    context 'all' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'only separate' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
        logout
        visit user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
    end

    context 'all' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_separate_projects_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
        logout
        visit user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
    end
  end
end
