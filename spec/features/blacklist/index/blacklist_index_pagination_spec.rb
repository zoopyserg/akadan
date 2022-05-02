require 'rails_helper'

RSpec.feature "Index Blacklist Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  # not testing as it's too verbose to be useful
end
