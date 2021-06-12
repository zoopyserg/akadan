require 'rails_helper'

RSpec.feature "ConnectionCreation Record B", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    context 'basic connection setting without any limiations, test functionality' do
      let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
      let!(:record_a) { create :record, name: 'Record A', user: user }
      let!(:record_b) { create :record, name: 'Record B', user: user }

      before do
        visit root_path
        sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      it 'should let me create' do
        expect {
          create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
        }.to change {
          user.connections.where(record_b_id: record_b.reload.id).count
        }.by(1)
      end
    end

    describe 'public/private records' do

    end

    describe 'excluding record A from record B list' do

    end

    describe 'circular dependency exclusion' do

    end

    describe 'limiting targets by record type' do
      let!(:connection_type) { create :connection_type, target_type: target_type, user: user }
      let!(:record_type_1) { create :record_type, user: user }
      let!(:record_type_2) { create :record_type, user: user }
      let!(:record_subtype_1) { create :record_type, user: user }
      let!(:record_subtype_2) { create :record_type, user: user }
      let!(:record_a) { create :record, record_type: record_type_1, user: user }
      let!(:record_b1) { create :record, name: 'Record B1', record_type: record_type_1, user: user }
      let!(:record_b2) { create :record, name: 'Record B2', record_type: record_type_2, user: user }
      let!(:record_b3) { create :record, name: 'Record B3', record_type: record_subtype_1, user: user }
      let!(:record_b4) { create :record, name: 'Record B4', record_type: record_subtype_2, user: user }
      let!(:connection1) { create :connection, user: user, record_a: record_b1, record_b: record_b3 }
      let!(:connection2) { create :connection, user: user, record_a: record_b2, record_b: record_b4 }

      before do
        visit root_path
        sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      context 'target can be any type' do
        let(:target_type) { 'any' }

        it 'should have all the options for b' do
          expect_dropdown_to_contain_option('connection_record_b_id', 'Record B1')
          expect_dropdown_to_contain_option('connection_record_b_id', 'Record B2')
          expect_dropdown_to_contain_option('connection_record_b_id', 'Record B3')
          expect_dropdown_to_contain_option('connection_record_b_id', 'Record B4')
        end
      end

      context 'target only same as source' do
        let(:target_type) { 'same_as_source' }

        it 'should only have the records_b of the same type' do
          expect_dropdown_to_contain_option('connection_record_b_id', 'Record B1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'Record B2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'Record B3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'Record B4')
        end
      end

      context 'target can be only of specific type' do
        let(:target_type) { 'specific_type' }

      end

      context 'target can be only specific subtype of specific type' do
        let(:target_type) { 'specific_subtype' }

      end
    end

    describe 'limiting targets by hierarchy' do

      context 'target only siblings' do

      end

      context 'target all previous parents' do

      end

      context 'target deep siblings' do

      end

      context 'target all records of my tree' do

      end

      context 'target all' do

      end

      context 'target root records' do

      end

      context 'target root of this tree' do

      end

      context 'target closest parent of a specific type' do

      end

    end
  end
end
