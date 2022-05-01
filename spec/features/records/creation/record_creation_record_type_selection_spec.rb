require 'rails_helper'

RSpec.feature "New Record Type Selection", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user }

    before do
      login_as user, scope: :user
    end

    context 'specific_subtype' do
      context 'other peoples record types' do
        let!(:someone_elses_private_type) { create :record_type, name: 'Someone Elses Private Type', is_public: false }
        let!(:someone_elses_public_type) { create :record_type, name: 'Someone Elses Public Type', is_public: true }

        before { visit new_record_path }

        before { find(:css, '.choices').click }

        it 'should not include someone elses private type' do
          expect(page.all('.choices__item').map(&:text)).not_to include('Someone Elses Private Type')
        end

        it 'should include someone elses public type' do
          expect(page.all('.choices__item').map(&:text)).to include('Someone Elses Public Type')
        end
      end

      context 'my record types' do
        let!(:record_type) { create :record_type, name: 'My Type', user: user, is_public: is_public }

        before { visit new_record_path }

        context 'public record type' do
          let(:is_public) { true }

          it 'should let me create' do
            expect {
              fill_in :record_name, with: 'boo'
              choose_record_type('My Type')
              click_on 'Create!'
            }.to change {
              user.records.where(record_type_id: record_type.reload.id).count
            }.by(1)
          end
        end

        context 'private record type' do
          let(:is_public) { false }

          it 'should let me create' do
            expect {
              fill_in :record_name, with: 'boo'
              choose_record_type('My Type')
              click_on 'Create!'
            }.to change {
              user.records.where(record_type_id: record_type.reload.id).count
            }.by(1)
          end
        end
      end
    end
  end
end
