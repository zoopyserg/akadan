require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:design1) { create :design, user: user1, is_public: true, designable: user1 }
  let!(:design2) { create :design, user: user2, is_public: false, designable: user1 }

  let!(:column1) { create :column, design: design1, collapsed: false }
  let!(:column2) { create :column, design: design2, collapsed: false }

  context 'not signed in' do
    context 'persist default column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end
    end

    context 'persist public column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end
    end
  end

  context 'user1 signed in' do
    before { login_as user1 }

    context 'persist default column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end
    end

    context 'persist public column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_no_css '.record_semicollapsed' }
        it { expect(page).to have_css '.record_collapsed', count: 4 }
      end
    end
  end

  context 'user2 signed in' do
    before { login_as user2 }

    context 'persist default column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_0_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end
    end

    context 'persist private column' do
      context 'collapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_false').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_css '.record_semicollapsed', count: 2 }
        it { expect(page).to have_css '.record_collapsed', count: 2 }
      end

      context 'semicollapsed' do
        before do
          visit user_path(user1)
          find(:css, '#desire_design_attributes_columns_attributes_1_collapsed_true').click
          click_on 'Update Column Filters', match: :first
          visit user_path(user1)
        end

        it { expect(page).to have_no_css '.record_semicollapsed' }
        it { expect(page).to have_css '.record_collapsed', count: 4 }
      end
    end
  end
end
