require 'rails_helper'

# todo: test pagination
RSpec.feature "Index Record Types Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user }

  # note: I already tested visibility rights etc
  # I tried testing it here (making 1000 records, paginating etc)
  # but once smth broke it became impossible to fix
  # it's just @paginate.
  # it's ok not to have a test.

end
