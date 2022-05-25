require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }

  let!(:collapsed_column_params) { [ { collapsed: true } ] }
  let!(:semicollapsed_column_params) { [ { collapsed: false } ] }

  context 'not signed in' do
    context 'collapsed' do
      before do
        visit records_path(columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit records_path(columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'collapsed' do
      before do
        visit records_path(columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit records_path(columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'collapsed' do
      before do
        visit records_path(columns: collapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      it { expect(page).to have_no_css '.record_collapsed' }
    end

    context 'semicollapsed' do
      before do
        visit records_path(columns: semicollapsed_column_params)
        find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
        click_on 'Update Column Filters'
        expect(current_path).to eq records_path
      end

      it { expect(page).to have_css '.record_collapsed', count: 2 }
      it { expect(page).to have_no_css '.record_semicollapsed' }
    end
  end
end
