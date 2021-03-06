require 'rails_helper'

RSpec.feature "Unsolved Tree Records Counter for others", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:solution_connection_type_id) { ConnectionType.solution_connection_type.id }

  context 'not signed in' do
    let!(:public_record) { create :record, :with_dot, user: user1, is_public: true }

    before { visit record_path(public_record) }

    it { expect(page).to have_no_content "Other people's unsolved records in tree" }
  end

  context 'signed in as user2 (not owner)' do
    before do
      login_as user2
    end

    context 'single unsolved record' do
      let!(:public_record) { create :record, :with_dot, user: user1, is_public: true }

      before { visit record_path(public_record) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 1" }
    end

    context 'single solved record' do
      let!(:public_record) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_solution) { create :record, :with_dot, user: user1, is_public: true }

      let!(:solution_connection) { create :connection, record_a: public_record, record_b: public_solution, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 1" } # because in the tree the solution is itself "unsolved"
    end

    context 'two destructive subrecords, one solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 3" } # because in the tree the solution is itself "unsolved"
    end

    context 'two destructive subrecords, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 2" } # because in the tree the solution is itself "unsolved"
    end

    context 'two non-destructive subrecords, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: false }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 3" } # because in the tree the solution is itself "unsolved"
    end

    context 'two subrecords, one destructive one none-destructive, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type1) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }
      let!(:subsystem_connection_type2) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: false }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type1, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type2, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 3" } # because in the tree the solution is itself "unsolved"
    end
  end

  context 'signed in as user1 (owner)' do
    before do
      login_as user1
    end

    context 'single unsolved record' do
      let!(:public_record) { create :record, :with_dot, user: user1, is_public: true }

      before { visit record_path(public_record) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" }
    end

    context 'single solved record' do
      let!(:public_record) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_solution) { create :record, :with_dot, user: user1, is_public: true }

      let!(:solution_connection) { create :connection, record_a: public_record, record_b: public_solution, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" } # because in the tree the solution is itself "unsolved"
    end

    context 'two destructive subrecords, one solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" } # because in the tree the solution is itself "unsolved"
    end

    context 'two destructive subrecords, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" } # because in the tree the solution is itself "unsolved"
    end

    context 'two non-destructive subrecords, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: false }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" } # because in the tree the solution is itself "unsolved"
    end

    context 'two subrecords, one destructive one none-destructive, both solved' do
      let!(:public_record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:public_record4) { create :record, :with_dot, user: user1, is_public: true }
      let!(:public_record5) { create :record, :with_dot, user: user1, is_public: true }

      let!(:subsystem_connection_type1) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: true }
      let!(:subsystem_connection_type2) { create :connection_type, user: user1, is_public: true, name: 'subrecord', destructive: false }

      let!(:connection1) { create :connection, connection_type: subsystem_connection_type1, record_a: public_record1, record_b: public_record2 }
      let!(:connection2) { create :connection, connection_type: subsystem_connection_type2, record_a: public_record1, record_b: public_record3 }

      let!(:solution_connection1) { create :connection, record_a: public_record3, record_b: public_record4, connection_type_id: solution_connection_type_id }
      let!(:solution_connection2) { create :connection, record_a: public_record2, record_b: public_record5, connection_type_id: solution_connection_type_id }

      before { visit record_path(public_record1) }

      it { expect(page).to have_content "Other people's unsolved records in tree: 0" } # because in the tree the solution is itself "unsolved"
    end
  end
end
