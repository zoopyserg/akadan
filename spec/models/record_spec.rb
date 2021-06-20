require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should belong_to :user }
  it { should belong_to :record_type }
  it { should have_many(:dots).dependent(:destroy) }

  describe 'type selection scopes' do

  end

  describe 'parentship scopes' do
    let!(:user) { create :user }
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

    context 'target all' do
      subject { Record.without_source(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).to include(record_0)
        expect(subject).to include(record_1)
        expect(subject).to include(record_2)
        expect(subject).to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).to include(record_5)
        expect(subject).to include(record_6)
        expect(subject).to include(record_7)
        expect(subject).to include(record_8)
        expect(subject).to include(record_9)
        expect(subject).to include(record_10)
      end
    end

    context 'target all without cycles' do
      subject { Record.all_without_cycles(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).not_to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).to include(record_2)
        expect(subject).not_to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).to include(record_5)
        expect(subject).to include(record_6)
        expect(subject).to include(record_7)
        expect(subject).not_to include(record_8)
        expect(subject).to include(record_9)
        expect(subject).to include(record_10)
      end
    end

    context 'all_roots' do
      subject { Record.all_roots }

      it 'should show correct probable record_bs' do
        expect(subject).to include (record_0)
        expect(subject).not_to include (record_1)
        expect(subject).not_to include (record_2)
        expect(subject).not_to include (record_3)
        expect(subject).not_to include (record_4)
        expect(subject).not_to include (record_5)
        expect(subject).not_to include (record_6)
        expect(subject).not_to include (record_7)
        expect(subject).to include (record_8)
        expect(subject).not_to include (record_9)
        expect(subject).to include (record_10)
      end
    end

    context 'all_roots_without_cycles' do
      subject { Record.all_roots_without_cycles(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).not_to include (record_0)
        expect(subject).not_to include (record_1)
        expect(subject).not_to include (record_2)
        expect(subject).not_to include (record_3)
        expect(subject).not_to include (record_4)
        expect(subject).not_to include (record_5)
        expect(subject).not_to include (record_6)
        expect(subject).not_to include (record_7)
        expect(subject).not_to include (record_8)
        expect(subject).not_to include (record_9)
        expect(subject).to include (record_10)
      end
    end

    context 'target only siblings' do
      subject { Record.siblings(user, record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).not_to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).not_to include(record_2)
        expect(subject).not_to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).to include(record_5)
        expect(subject).not_to include(record_6)
        expect(subject).not_to include(record_7)
        expect(subject).not_to include(record_8)
        expect(subject).not_to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    context 'target all previous parents' do
      subject { Record.all_parents_of_record(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).to include(record_0)
        expect(subject).to include(record_1)
        expect(subject).not_to include(record_2)
        expect(subject).to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).not_to include(record_5)
        expect(subject).not_to include(record_6)
        expect(subject).not_to include(record_7)
        expect(subject).to include(record_8)
        expect(subject).not_to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    context 'target all records of my tree' do
      subject { Record.all_tree_records_of_record(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).to include(record_0)
        expect(subject).to include(record_1)
        expect(subject).to include(record_2)
        expect(subject).to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).to include(record_5)
        expect(subject).to include(record_6)
        expect(subject).to include(record_7)
        expect(subject).to include(record_8)
        expect(subject).to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    context 'target deep siblings' do
      # I'm doing it as "all tree members without parents
      subject { Record.deep_siblings(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).not_to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).to include(record_2)
        expect(subject).not_to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).to include(record_5)
        expect(subject).to include(record_6)
        expect(subject).to include(record_7)
        expect(subject).not_to include(record_8)
        expect(subject).to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    context 'target root of this tree' do
      # there is no "root", there's "roots" (records of my tree that have only the outgoing connections)
      subject { Record.root(record_4) }

      it 'should show correct probable record_bs' do
        expect(subject).to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).not_to include(record_2)
        expect(subject).not_to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).not_to include(record_5)
        expect(subject).not_to include(record_6)
        expect(subject).not_to include(record_7)
        expect(subject).to include(record_8)
        expect(subject).not_to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    context 'target parents of a specific type' do
      subject { Record.parents_specific_type(record_4, record_type_2) }

      it 'should show correct probable record_bs' do
        expect(subject).to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).not_to include(record_2)
        expect(subject).to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).not_to include(record_5)
        expect(subject).not_to include(record_6)
        expect(subject).not_to include(record_7)
        expect(subject).not_to include(record_8)
        expect(subject).not_to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end

    # todo:
    # having a "closest" one does not even make any sense now
    # because "closest" is undefined when I have all records
    # on the same distance from this one.
    # the only way to go arount this is to sort by "which are the closest to this record"
    # plus I have the search. Dunno.
    # Remove this.
    # I can do "parents"."of type"."limit 1" but that does not solve an impossible to solve problem where first two are equidistant.
    # I could do "group by path length" and show first several records.
    # but that's a story for another day.
    #
    # todo #2:
    # я могу прийти несколькими путями к одному и тому же ноуду. что тогда?
    #
    # todo: right now it works (created_at: :desc).
    # but it's a dummy code.
    # it doesn't have this meaning that I want here.
    # the "search parent ids" sql does order them by path.
    # so I "could" ... use ordinarity_with.
    # but I'm telling you there are a million ways it can go wrong.
    # there is no shortest path for majority of cases.
    # committing this and leaving it alone.
    # maybe come back after everything else is done.
    #
    # worst case scenario I rename it to be "latest parent of type"
    context 'target closest parent of a specific type' do
      subject { Record.closest_of_type(record_4, record_type_2) }

      it 'should show correct probable record_bs' do
        expect(subject).not_to include(record_0)
        expect(subject).not_to include(record_1)
        expect(subject).not_to include(record_2)
        expect(subject).to include(record_3)
        expect(subject).not_to include(record_4)
        expect(subject).not_to include(record_5)
        expect(subject).not_to include(record_6)
        expect(subject).not_to include(record_7)
        expect(subject).not_to include(record_8)
        expect(subject).not_to include(record_9)
        expect(subject).not_to include(record_10)
      end
    end
  end
end
