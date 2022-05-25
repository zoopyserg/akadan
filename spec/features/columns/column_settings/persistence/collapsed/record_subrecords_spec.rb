require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 }
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record1 }

  let!(:design1) { create :design, user: user1, is_public: true, designable: public_record1 }
  let!(:design2) { create :design, user: user2, is_public: false, designable: public_record1 }

  let!(:column1) { create :column, design: design1, collapsed: false }
  let!(:column2) { create :column, design: design2, collapsed: false }

  context 'not signed in' do
    context 'persisting default column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end
    end

    context 'persisting public column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'persisting default column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end
    end

    context 'persisting public column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_collapsed', count: 2 }
        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      end
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'persisting default column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end
    end

    context 'persisting private column' do
      context 'collapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 4 }
        it { expect(page).to have_no_css '.record_collapsed' }
      end

      context 'semicollapsed' do
        before do
          visit record_path(public_record1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit record_path(public_record1)
        end

        it { expect(page).to have_css '.record_collapsed', count: 2 }
        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
      end
    end
  end
end
