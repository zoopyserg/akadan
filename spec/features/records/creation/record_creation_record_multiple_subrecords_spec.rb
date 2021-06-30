require 'rails_helper'

RSpec.feature "New Record Multiple Subrecords", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  xcontext 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:record_type) { create :record_type, user: user, name: 'Some Record Type' }
    let!(:connection_type) { create :connection_type, user: user, name: 'Some Connection Type' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      expect(user.records.where(name: ['poo', 'boo', 'doo']).count).to eq 0
      visit new_record_path
    end

    it 'should let me create' do
      fill_in :record_name, with: 'boo'
      choose 'Some Record Type', from: :record_type
      click_on 'Add Subrecord'
      fill_in :subrecord_1_name, with: 'poo'
      choose 'Some Connection Type', from: :subrecord_1_connection_type
      choose 'Some Record Type', from: :subrecord_1_record_type
      click_on 'Add Subrecord'
      fill_in :subrecord_2_name, with: 'doo'
      choose 'Some Connection Type', from: :subrecord_1_connection_type
      choose 'Some Record Type', from: :subrecord_1_record_type

      expect(user.records.where(name: 'boo', record_type: record_type).count).to eq 0
      expect(user.records.where(name: 'poo', record_type: record_type).count).to eq 0
      expect(user.records.where(name: 'doo', record_type: record_type).count).to eq 0

      click_on 'Create!'

      expect(user.records.where(name: 'boo', record_type: record_type).count).to eq 1
      expect(user.records.where(name: 'poo', record_type: record_type).count).to eq 1
      expect(user.records.where(name: 'doo', record_type: record_type).count).to eq 1

      poo = user.records.where(name: 'poo').first
      boo = user.records.where(name: 'boo').first
      doo = user.records.where(name: 'doo').first

      expect(users.connections.where(record_a: 'boo', record_b: 'poo', connection_type: connection_type).count).to eq 1
      expect(users.connections.where(record_a: 'boo', record_b: 'doo', connection_type: connection_type).count).to eq 1
    end
  end
end
