require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record0) { create :record, :with_dot, name: 'Public Record 0', user: user1, is_public: true }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 3', user: user1, is_public: true }

  let!(:connection0) { create :connection, record_b: public_record1, record_a: public_record0 } # should be displayed
  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 } # so 2 is direct child of 1
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record2 } # so 3 is deep child of 2

  context 'not signed in' do
    context 'only_separate' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Public Record 3' }
    end

    context 'all' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'only_separate' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Public Record 3' }
    end

    context 'all' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'only separate' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
        logout
        visit record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
    end

    context 'all' do
      before do
        visit record_path(public_record1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        find(:css, '#desire_design_attributes_columns_attributes_0_only_direct_children_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
        logout
        visit record_path(public_record1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1', count: 1 }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
    end
  end
end
