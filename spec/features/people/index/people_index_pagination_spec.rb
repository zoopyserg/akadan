require 'rails_helper'

RSpec.feature "Index People Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', first_name: 'Jack', last_name: 'Daniels', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  # note: I'm not testing pagination because it's too verbose and too simple to test manually

end
