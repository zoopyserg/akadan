require 'rails_helper'

RSpec.feature "Completed Percentage", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'not signed in' do
    context '1 record in tree' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /0%/i, exact: true }
      end
    end

    context '2 records in tree' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record2 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /50%/i, exact: true } # parent
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    context '3 records in tree, chained' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record2 }
      let!(:connection2) { create :connection, user: user1, record_a: record2, record_b: record3 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /66%/i, exact: true } # grand parent
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /50%/i, exact: true } # parent
      end

      context 'record 3' do
        before { visit record_path(record3) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    context '3 records in tree, two -> one' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record3) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record3 }
      let!(:connection2) { create :connection, user: user1, record_a: record2, record_b: record3 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /50%/i, exact: true } # parents
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /50%/i, exact: true } # parents
      end

      context 'record 3' do
        before { visit record_path(record3) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    context '4 records in tree, chained' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record3) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record4) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record2 }
      let!(:connection2) { create :connection, user: user1, record_a: record2, record_b: record3 }
      let!(:connection3) { create :connection, user: user1, record_a: record3, record_b: record4 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /75%/i, exact: true } # grand grand parent
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /66%/i, exact: true } # grand parent
      end

      context 'record 3' do
        before { visit record_path(record3) }

        it { expect(page).to have_content /50%/i, exact: true } # parent
      end

      context 'record 4' do
        before { visit record_path(record4) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    context '4 records in tree, 3 chained & 1 into last' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record3) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record4) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record2 }
      let!(:connection2) { create :connection, user: user1, record_a: record2, record_b: record3 }
      let!(:connection3) { create :connection, user: user1, record_a: record4, record_b: record3 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /66%/i, exact: true } # grand parent
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /50%/i, exact: true } # parent
      end

      context 'record 3' do
        before { visit record_path(record3) }

        it { expect(page).to have_content /0%/i, exact: true } # parent
      end

      context 'record 4' do
        before { visit record_path(record4) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    context '4 records in tree, 3 chained & 1 into pre-last' do
      let!(:record1) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record2) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record3) { create :record, :with_dot, user: user1, is_public: true }
      let!(:record4) { create :record, :with_dot, user: user1, is_public: true }

      let!(:connection1) { create :connection, user: user1, record_a: record1, record_b: record2 }
      let!(:connection2) { create :connection, user: user1, record_a: record2, record_b: record3 }
      let!(:connection3) { create :connection, user: user1, record_a: record4, record_b: record2 }

      context 'record 1' do
        before { visit record_path(record1) }

        it { expect(page).to have_content /66%/i, exact: true } # grand parent
      end

      context 'record 2' do
        before { visit record_path(record2) }

        it { expect(page).to have_content /50%/i, exact: true } # grand parent
      end

      context 'record 3' do
        before { visit record_path(record3) }

        it { expect(page).to have_content /0%/i, exact: true } # parent
      end

      context 'record 4' do
        before { visit record_path(record4) }

        it { expect(page).to have_content /0%/i, exact: true } # child
      end
    end

    # todo: what happens if some of them are private
  end

  context 'signed in' do
    before do
      login_as user1
      visit record_path(record1)
    end

    xcontext 'does it matter if a usre is signed in? can any progress be not-counted if he is not signed in? for example if the connections are not public or something?' do
      # thinking about it.
      # Пока что решение такое:
      # Прогрес 1: для мира (только по публичным)
      # Прогрес 2: для меня (с учётом не только публичных но и моих связей)
      # Кнопка "Сделать мой ресёрч публичным" (которая сделает все связи этого древа публичными).
      #
      # Но я пока думаю. Два прогресса это как-то уж очень.
      #
      # Пока наверно оставим как есть (без разбивания на публичный и мой личный прогресс).
      # Потому что это новая фича.
      # По архитектуре всё работает.
      # Ты прав, так лучше. Но будем постепенно.
      # Вернёмся доделаем.
      it 'should say who created public record' do
        expect(page).to have_content 'Public Description'
      end

      it 'should say I created a private record' do
        expect(page).to have_content 'Private Description'
      end
    end
  end
end
