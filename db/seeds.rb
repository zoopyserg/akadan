require 'factory_bot_rails'
require 'faker'

if Rails.env.development? && !ENV['REAL']
  user1 = FactoryBot.create :user, :confirmed, :with_avatar, email: 'sergevinogradoff.personal@gmail.com', password: '12345678', password_confirmation: '12345678', first_name: 'Serge', last_name: 'Vinogradoff'
  user2 = FactoryBot.create :user, :confirmed, :with_avatar

  # needed for production
  FactoryBot.create :connection_type, name: 'Subsystem', user: user1, is_public: true
  FactoryBot.create :connection_type, name: 'Irrelevant Because...', user: user1, is_public: true
  FactoryBot.create :connection_type, name: 'Is Solved By...', user: user1, is_public: true
  FactoryBot.create :connection_type, name: 'Extracted To...', user: user1, is_public: true
  FactoryBot.create :record_type, name: 'Subsystem', user: user1, is_public: true
  FactoryBot.create :record_type, name: 'Solution', user: user1, is_public: true
  # end of stuff needed for production

  # messaging between users 1 & 2
  conversation = FactoryBot.create :conversation

  FactoryBot.create :participation, conversation: conversation, user: user1
  FactoryBot.create :participation, conversation: conversation, user: user2

  message = FactoryBot.create :message, body: "some body", sender: user1, conversation: conversation

  FactoryBot.create :reading, user: user1, message: message, read: false
  FactoryBot.create :reading, user: user2, message: message, read: true

  100.times do
    friend = FactoryBot.create :user, :confirmed, :with_avatar
    FactoryBot.create :friend_request, user: user1, friend: friend
    FactoryBot.create :friend_request, user: friend, friend: user1
  end


  # public/private types/records etc.

  %i[ record connection_type record_type sensor connection ].each do |item|
    Faker::Number.digit.times do
      FactoryBot.create item, user: user1, is_public: Faker::Boolean.boolean
    end
  end

  # heavy record
  record = FactoryBot.create :record, user: user1, name: 'Heavy Record', is_public: Faker::Boolean.boolean
  sub_record = nil
  sub_sub_record = nil
  sub_sub_sub_record = nil

  sub_connection = nil
  sub_sub_connection = nil
  sub_sub_sub_connection = nil

  10.times do
    sub_record = FactoryBot.create :record, user: user1, is_public: Faker::Boolean.boolean
    sub_connection = FactoryBot.create :connection, user: user1, record_a: record, record_b: sub_record
  end

  10.times do
    sub_sub_record = FactoryBot.create :record, user: user1, is_public: Faker::Boolean.boolean
    sub_sub_connection = FactoryBot.create :connection, user: user1, record_a: sub_record, record_b: sub_sub_record
  end

  10.times do
    sub_sub_sub_record = FactoryBot.create :record, user: user1, is_public: Faker::Boolean.boolean
    sub_sub_sub_connection = FactoryBot.create :connection, user: user1, record_a: sub_sub_record, record_b: sub_sub_sub_record
  end

  # a bunch of random users
  Faker::Number.digit.times do
    some_user = FactoryBot.build :user, :confirmed, :with_avatar

    %i[ record connection_type record_type sensor connection ].each do |item|
      Faker::Number.digit.times do
        FactoryBot.create item, user: some_user, is_public: Faker::Boolean.boolean
      end
    end
  end


  # idea for creating random friendships:
  # 1000_000.times { User.all.sample(2).tap { |x, y| FactoryBot.create(:friend_request, user: x, friend: y); FactoryBot.create(:friend_request, user: y, friend: x); } }

elsif Rails.env.staging? || Rails.env.production? || ENV['REAL']
  admin = FactoryBot.create :user, :confirmed, :with_avatar, email: 'sergevinogradoff.personal@gmail.com', password: '12345678', password_confirmation: '12345678', first_name: 'Serge', last_name: 'Vinogradoff' # todo: change password

  # English
  FactoryBot.create :connection_type, name: 'Subsystem', user: admin, is_public: true, description: 'Task A is a subsystem of task B.'
  FactoryBot.create :connection_type, name: 'Irrelevant Because...', user: admin, is_public: true, description: 'Task A is irrelevant because it was planned to solve task B.'
  FactoryBot.create :connection_type, name: 'Is Solved By...', user: admin, is_public: true, description: 'Task A gets solved by task B.'
  FactoryBot.create :connection_type, name: 'Extracted To...', user: admin, is_public: true, description: 'Task A was transfered as a part of task B.'

  FactoryBot.create :connection_type, name: 'Repetitive Problem', user: admin, target_hierarchy: 'all', target_type: 'any', is_public: true, description: 'Task A is a repetitive problem in context of system B'
  FactoryBot.create :connection_type, name: 'Repetitive Task', user: admin, target_hierarchy: 'all', target_type: 'any', is_public: true, description: 'Task A repeats in the context of system B.'

  FactoryBot.create :record_type, name: 'Subsystem', user: admin, is_public: true, description: 'A part of another system that gets periodically turned on.'
  FactoryBot.create :record_type, name: 'Solution', user: admin, is_public: true, description: 'A solution of certain tasks.'

  FactoryBot.create :record_type, name: 'Repetitive Task', user: admin, is_public: true, description: 'A repetitive taask (at work, etc.)'
  FactoryBot.create :record_type, name: 'Repetitive Problem', user: admin, is_public: true, description: 'A repetitive situation that does not let you grow.'
  FactoryBot.create :record_type, name: 'Repetition', user: admin, is_public: true, description: 'Any repetition.'
  FactoryBot.create :record_type, name: 'Pleasant Repetition', user: admin, is_public: true, description: 'A repetition that gives strength and meaning of life.'
  FactoryBot.create :record_type, name: 'Harmful Repetition', user: admin, is_public: true, description: 'A repetition that takes time and resources and brings harm.'

  # Ukrainian
  FactoryBot.create :connection_type, name: 'Підсистема', user: admin, is_public: true, description: 'Задача А є підсистемою задачі Б'
  FactoryBot.create :connection_type, name: 'Несуттєво через...', user: admin, is_public: true, description: 'Задача А несуттєва, бо вже заплановано вирішити задачу Б'
  FactoryBot.create :connection_type, name: 'Вирішується пунктом...', user: admin, is_public: true, description: 'Задача А вирішується задачею Б'
  FactoryBot.create :connection_type, name: 'Винесено в...', user: admin, is_public: true, description: 'Задачу А перенесено як частину задачі Б'

  FactoryBot.create :connection_type, name: 'Повторювана Проблема', user: admin, target_hierarchy: 'all', target_type: 'any', is_public: true, description: 'Задача А є повторюваною проблемою в контексті системи Б'
  FactoryBot.create :connection_type, name: 'Повторювана Задача', user: admin, target_hierarchy: 'all', target_type: 'any', is_public: true, description: 'Задача А повторюється в контексті системи Б'

  FactoryBot.create :record_type, name: 'Підсистема', user: admin, is_public: true, description: 'Частина іншої системи яка періодично включається'
  FactoryBot.create :record_type, name: 'Рішення', user: admin, is_public: true, description: 'Рішення певних повторюваних задач'

  FactoryBot.create :record_type, name: 'Повторювана Задача', user: admin, is_public: true, description: 'Повторюване завдання (по роботі і т.д.)'
  FactoryBot.create :record_type, name: 'Повторювана Проблема', user: admin, is_public: true, description: 'Повторювана ситуація яка не дає розвиватись'
  FactoryBot.create :record_type, name: 'Повторення', user: admin, is_public: true, description: 'Будь яке повторення.'
  FactoryBot.create :record_type, name: 'Приємне повторення', user: admin, is_public: true, description: 'Повторення, яке додає сил і змісту в житті.'
  FactoryBot.create :record_type, name: 'Шкідливе повторення', user: admin, is_public: true, description: 'Повторення яке забирає час, сили і приносить шкоду.'
end
