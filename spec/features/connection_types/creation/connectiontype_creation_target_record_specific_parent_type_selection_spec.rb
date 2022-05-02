require 'rails_helper'

RSpec.feature "ConnectionTypeCreation Target Record Type Specific Parent Type Selection", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      login_as user
    end

    context 'specific_subtype' do
      context 'other peoples record types' do
        let!(:someone_elses_private_type) { create :record_type, name: 'Someone Elses Private Type', is_public: false }
        let!(:someone_elses_public_type) { create :record_type, name: 'Someone Elses Public Type', is_public: true }

        before { visit new_connection_type_path }

        it 'should not include someone elses private type' do
          expect(page.all('select#connection_type_target_record_type_id option').map(&:text)).not_to include('Someone Elses Private Type')
        end

        it 'should include someone elses public type' do
          expect(page.all('select#connection_type_target_record_type_id option').map(&:text)).to include('Someone Elses Public Type')
        end
      end

      context 'my record types' do
        let!(:record_type) { create :record_type, name: 'My Type', user: user, is_public: is_public }

        before { visit new_connection_type_path }
        context 'public record type' do
          let(:is_public) { true }

          it 'should let me create' do
            expect {
              fill_in :connection_type_name, with: 'boo'
              choose :connection_type_target_type_specific_type
              select 'My Type', from: :connection_type_target_record_type_id
              click_on 'Create!'
            }.to change {
              user.connection_types.where(target_record_type: record_type.reload.id).count
            }.by(1)
          end
        end

        context 'private record type' do
          let(:is_public) { false }

          it 'should let me create' do
            expect {
              fill_in :connection_type_name, with: 'boo'
              choose :connection_type_target_type_specific_type
              select 'My Type', from: :connection_type_target_record_type_id
              click_on 'Create!'
            }.to change {
              user.connection_types.where(target_record_type: record_type.reload.id).count
            }.by(1)
          end
        end
      end
    end
  end
end
