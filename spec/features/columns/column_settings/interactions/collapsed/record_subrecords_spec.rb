require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 }
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record1 }

  let!(:collapsed_column_params) { [ { collapsed: true } ] }
  let!(:semicollapsed_column_params) { [ { collapsed: false } ] }

  context 'not signed in' do
    context 'collapsed' do
      before do
        visit record_path(public_record1, columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit record_path(public_record1, columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'collapsed' do
      before do
        visit record_path(public_record1, columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit record_path(public_record1, columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'collapsed' do
      before do
        visit record_path(public_record1, columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit record_path(public_record1, columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq record_path(public_record1)
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end
end
