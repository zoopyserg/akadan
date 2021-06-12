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
        visit new_connection_path
      end

      it 'should let me create' do
        expect {
          create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
        }.to change {
          user.connections.where(record_b_id: record_b.reload.id).count
        }.by(1)
      end
    end

    describe 'circular dependency exclusion' do

    end

    describe 'limiting targets by record type' do
      context 'target only same as source' do

      end

      context 'target can be any type' do

      end

      context 'target can be only of specific type' do

      end

      context 'target can be only specific subtype of specific type' do

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
