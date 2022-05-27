require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }

  let!(:public_record0) { create :record, :with_dot, name: 'Public Record 0', user: user1, is_public: true }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true, record_type: RecordType.solution_record_type }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 3', user: user1, is_public: true }
  let!(:public_record4) { create :record, :with_dot, name: 'Public Record 4', user: user1, is_public: true }

  let!(:connection0) { create :connection, record_b: public_record1, record_a: public_record0 } # should be displayed
  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 } # solved
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record1 } # not solved
  let!(:connection3) { create :connection, record_a: public_record2, record_b: public_record4, connection_type: ConnectionType.solution_connection_type }

  let!(:design) { create :design, user: user1, designable: user1 }

  context 'not signed in' do
    context 'solved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_solved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_no_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Public Record 3' }
      it { expect(page).to have_no_content 'Public Record 4' }
    end

    context 'unsolved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_unsolved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end

    context 'any' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_any').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'solved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_solved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_no_content 'Public Record 0' }
      it { expect(page).to have_no_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Public Record 3' }
      it { expect(page).to have_no_content 'Public Record 4' }
    end

    context 'unsolved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_unsolved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end

    context 'any' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_any').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'solved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_solved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
        logout
        visit user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end

    context 'unsolved' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_unsolved').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
        logout
        visit user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end

    context 'any' do
      before do
        visit user_path(user1)
        expect(page).to have_content 'Public Record 1'
        expect(page).to have_content 'Public Record 2'
        expect(page).to have_content 'Public Record 3'
        expect(page).to have_content 'Public Record 4'
        find(:css, '#desire_design_attributes_columns_attributes_0_filter_solved_status_any').click
        click_on 'Update Column Filters'
        expect(current_path).to eq user_path(user1)
        logout
        visit user_path(user1)
      end

      it { expect(page).to have_content 'Public Record 0' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_content 'Public Record 3' }
      it { expect(page).to have_content 'Public Record 4' }
    end
  end
end
