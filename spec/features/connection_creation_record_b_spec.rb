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

    describe 'circular dependency exclusion' do

    end

    describe 'limiting targets by record type' do
      let!(:record_type_1) { create :record_type, user: user }
      let!(:record_type_2) { create :record_type, user: user }
      let!(:record_a) { create :record, name: 'A1', record_type: record_type_1, user: user }
      let!(:record_b1) { create :record, name: 'B1', record_type: record_type_1, user: user }
      let!(:record_b2) { create :record, name: 'B2', record_type: record_type_2, user: user }
      let!(:record_b3) { create :record, name: 'B3', record_type: record_type_1, user: user }
      let!(:record_b4) { create :record, name: 'B4', record_type: record_type_2, user: user }
      let!(:record_b5) { create :record, name: 'B5', record_type: record_type_1, user: user }
      let!(:record_b6) { create :record, name: 'B6', record_type: record_type_2, user: user }
      let!(:record_b7) { create :record, name: 'B7', record_type: record_type_1, user: user }
      let!(:record_b8) { create :record, name: 'B8', record_type: record_type_2, user: user }

      let!(:connection1) { create :connection, user: user, record_a: record_b1, record_b: record_b3 }
      let!(:connection2) { create :connection, user: user, record_a: record_b1, record_b: record_b4 }
      let!(:connection3) { create :connection, user: user, record_a: record_b2, record_b: record_b5 }
      let!(:connection4) { create :connection, user: user, record_a: record_b2, record_b: record_b6 }
      let!(:connection5) { create :connection, user: user, record_a: record_b6, record_b: record_b7 }
      let!(:connection6) { create :connection, user: user, record_a: record_b6, record_b: record_b8 }

      let!(:connection_type) { create :connection_type, target_type: target_type, user: user, target_record_type: record_type_2, target_record_subtype: record_type_2 }

      before do
        visit root_path
        sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      context 'target can be any type' do
        let(:target_type) { 'any' }

        it 'should have all the options for b' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'A1')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B1')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B2')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B3')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B4')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B5')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B6')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B7')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B8')
        end
      end

      context 'target only same as source' do
        let(:target_type) { 'same_as_source' }

        it 'should only have the records_b of the same type' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'A1')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B2')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B4')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B6')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B7')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B8')
        end
      end

      context 'target can be only of specific type' do
        let(:target_type) { 'specific_type' }

        it 'should only have the records_b of the required type' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'A1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B1')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B3')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B5')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B7')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B8')
        end
      end

      context 'target can be only specific subtype of specific type' do
        let(:target_type) { 'specific_subtype' }

        it 'should only have the records_b of the required' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'A1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B5')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', 'B7')
          expect_dropdown_to_contain_option('connection_record_b_id', 'B8')
        end
      end
    end

    describe 'limiting targets by hierarchy' do
      let!(:record_type_1) { create :record_type, user: user }
      let!(:record_type_2) { create :record_type, user: user }

      let!(:record_0) { create :record, name: '0', record_type: record_type_2, user: user }
      let!(:record_1) { create :record, name: '1', record_type: record_type_1, user: user }
      let!(:record_2) { create :record, name: '2', record_type: record_type_1, user: user }
      let!(:record_3) { create :record, name: '3', record_type: record_type_2, user: user }
      let!(:record_4) { create :record, name: '4', record_type: record_type_1, user: user }
      let!(:record_5) { create :record, name: '5', record_type: record_type_1, user: user }
      let!(:record_6) { create :record, name: '6', record_type: record_type_1, user: user }
      let!(:record_7) { create :record, name: '7', record_type: record_type_2, user: user }
      let!(:record_8) { create :record, name: '8', record_type: record_type_1, user: user }
      let!(:record_9) { create :record, name: '9', record_type: record_type_2, user: user }
      let!(:record_10) { create :record, name: '10', record_type: record_type_1, user: user }

      let!(:connection1) { create :connection, user: user, record_a: record_0, record_b: record_1 }
      let!(:connection2) { create :connection, user: user, record_a: record_1, record_b: record_2 }
      let!(:connection3) { create :connection, user: user, record_a: record_1, record_b: record_3 }
      let!(:connection4) { create :connection, user: user, record_a: record_3, record_b: record_4 }
      let!(:connection5) { create :connection, user: user, record_a: record_3, record_b: record_5 }
      let!(:connection6) { create :connection, user: user, record_a: record_5, record_b: record_6 }
      let!(:connection7) { create :connection, user: user, record_a: record_5, record_b: record_7 }
      let!(:connection8) { create :connection, user: user, record_a: record_8, record_b: record_3 }
      let!(:connection9) { create :connection, user: user, record_a: record_8, record_b: record_9 }

      let!(:connection_type) { create :connection_type, target_type: 'any', target_hierarchy: target_hierarchy, user: user, closest_parent_type: record_type_2 }

      before do
        visit root_path
        sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
        visit new_record_connection_type_connection_path(record_4, connection_type)
      end

      context 'target all' do
        let(:target_hierarchy) { 'all' }

        it 'should show correct probable record_bs' do
          expect_dropdown_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target root records' do
        let(:target_hierarchy) { 'all_roots' }

        it 'should show correct probable record_bs' do
          expect_dropdown_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target only siblings' do
        let(:target_hierarchy) { 'siblings' }

        it 'should show correct probable record_bs' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target all previous parents' do
        let(:target_hierarchy) { 'all_parent_generations' }

        it 'should show correct probable record_bs' do
          expect_dropdown_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target all records of my tree' do
        let(:target_hierarchy) { 'all_tree_records' }

        it 'should show correct probable record_bs' do
          expect_dropdown_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end


      context 'target deep siblings' do
        let(:target_hierarchy) { 'deep_siblings' }
        # I'm doing it as "all tree members without parents

        it 'should show correct probable record_bs' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target root of this tree' do
        let(:target_hierarchy) { 'root' }

        it 'should show correct probable record_bs' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end

      context 'target parents of a specific type' do
        let(:target_hierarchy) { 'specific_parent_type' }

        it 'should show correct probable record_bs' do
          expect_dropdown_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end

      # having a "closest" one does not even make any sense now
      # because "closest" is undefined when I have all records
      # on the same distance from this one.
      context 'target closest parent of a specific type' do
        let(:target_hierarchy) { 'closest_specific_parent_type' }

        it 'should show correct probable record_bs' do
          expect_dropdown_not_to_contain_option('connection_record_b_id', '0')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '1')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '2')
          expect_dropdown_to_contain_option('connection_record_b_id', '3')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '4')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '5')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '6')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '7')
          expect_dropdown_to_contain_option('connection_record_b_id', '8')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '9')
          expect_dropdown_not_to_contain_option('connection_record_b_id', '10')
        end
      end
    end
  end
end
