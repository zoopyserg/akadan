module FeaturesHelper
  # the answers to question WHERE go here.
  # the answers to question WHAT go to specs.

  def visit_records_path
    visit records_path(locale: 'en')
  end

  def sign_in(email, password)
    click_on 'Login'
    within '.card-authentication1' do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_on 'Sign In'
    end
  end

  def sign_up(username, first_name, last_name, email, password, password_confirmation)
    within '.card-authentication1' do
      fill_in 'user_first_name', with: first_name
      fill_in 'user_last_name', with: last_name
      fill_in 'user_username', with: username
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      check 'user_accept_terms'
      click_on 'Sign up'
    end
  end

  def sign_up_no_confirm(username, first_name, last_name, email, password, password_confirmation)
    within '.card-authentication1' do
      fill_in 'user_first_name', with: first_name
      fill_in 'user_last_name', with: last_name
      fill_in 'user_username', with: username
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      click_on 'Sign up'
    end
  end

  def reset_password(email)
    within '.card-authentication1' do
      fill_in 'user_email', with: email
      click_on 'Reset Password'
    end
  end

  def create_record(name, description, type)
    fill_in 'record_name', with: name
    fill_in 'record_description', with: description
    select type, from: :record_record_type_id
    click_on 'Create!'
  end

  def create_record_type(name, description)
    fill_in 'record_type_name', with: name
    fill_in 'record_type_description', with: description
    click_on 'Create!'
  end

  def create_connection(name, description, type, record_a, record_b)
    fill_in 'connection_name', with: name
    fill_in 'connection_description', with: description
    select type, from: :connection_connection_type_id
    select record_a, from: :connection_record_a_id
    select record_b, from: :connection_record_b_id
    click_on 'Create!'
  end

  def create_connection_type(name, description)
    fill_in 'connection_type_name', with: name
    fill_in 'connection_type_description', with: description
    click_on 'Create!'
  end

  def create_sensor(name, description)
    fill_in 'sensor_name', with: name
    fill_in 'sensor_description', with: description
    click_on 'Create!'
  end

  def open_image(name)
    Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/images/#{name}"), 'image/jpeg')
  end

  def expect_dropdown_to_contain_option(dropdown, option)
    expect(page.all("select##{dropdown} option").map(&:text)).to include(option)
  end

  def expect_dropdown_not_to_contain_option(dropdown, option)
    expect(page.all("select##{dropdown} option").map(&:text)).not_to include(option)
  end

  def toggle_tables
    click_on_selector '#splitTablesEnabled input'
  end

  def split(row, into = ["obstacle1\nobstacle2"])
    click_on_selector split_btn(row)

    fill_in 'OBSTACLES:', with: into[0] if into[0]
    fill_in 'STEPS:', with: into[1] if into[1]
    fill_in 'COMPONENTS:', with: into[2] if into[2]
    fill_in 'PLACES:', with: into[3] if into[3]
    fill_in 'CONSEQUENCES:', with: into[4] if into[4]
    fill_in 'Discribe this problem using other words:', with: into[5] if into[5]
    fill_in 'Reasons you thought it is important to solve it as soon as possible?', with: into[6] if into[6]

    submit_modal

    if into == ["obstacle1\nobstacle2"]
      expect(page).to have_content 'obstacle1'
      expect(page).to have_content 'obstacle2'
    end

    expect(page).to have_content 'Record was split successfully'
    find('.notification-title', text: 'Record was split successfully').click
    expect(page).not_to have_content 'Record was split successfully' # this line takes extra 5 minutes, but I need it
  end

  def repeat(row, table = 1)
    click_on_selector repeat_btn(row, table)
    expect(page).not_to have_css '.fa-spinner'
  end

  def set_dependency(row, child = '')
    click_on_selector depends_on_btn(row)
    expect(page).to have_css '.modal'

    page.execute_script "document.getElementById('newchild').__vue__.value = document.getElementById('newchild').__vue__.options.find((element) => { return element.problem == '" + child + "' } )"

    submit_modal

    expect(page).to have_content 'Connection created with this record:'
    find('.notification-title', text: 'Connection created with this record:').click
    expect(page).not_to have_content 'Connection created with this record:' # this line takes extra 5 minutes, but I need it
  end

  def submit_modal
    expect(page).to have_css '.modal .btn-success'
    page.execute_script "document.querySelector('.modal .btn-success').click()"
    # expect(page).not_to have_css '.modal'
  end

  def close_modal
    expect(page).to have_css '.modal'
    page.execute_script "document.querySelector('.modal .close').click()"
    expect(page).not_to have_css '.modal'
  end

  def solve(row, table=1)
    click_on_selector solve_btn(row, table)

    if table == 2
      click_on 'Continue (2)'
      click_on 'Continue (1)'
    end
  end

  def solve_btn(row, table=1)
    action_button 1, row, table
  end

  def split_btn(row)
    action_button 2, row, 1
  end

  def repeat_btn(row, table=1)
    action_button 3, row, table
  end

  def depends_on_btn(row=1)
    action_button 4, row, 1
  end

  def action_button(button, row, table=1)
    ".semiTable:nth-of-type(#{table.to_s}) .card:nth-of-type(#{row.to_s}) .btn:nth-of-type(#{button.to_s})"
  end

  def scroll_down
    page.execute_script "window.scroll(0, 800)"
  end

  def dot(table=1)
    ".semiTable:nth-of-type(#{table.to_s}) .card .col:nth-child(1) [data-icon='star']"
  end

  def checkmark(table=1)
    ".semiTable:nth-of-type(#{table.to_s}) .card .col:nth-child(2) [data-icon='check']"
  end

  def circle
    ".semiTable:nth-of-type(2) .card .col:nth-child(3) .circle"
  end

  def crossed
    ".semiTable .card .col:nth-child(3) .crossed"
  end

  def click_on_selector(what)
    expect(page).to have_css what
    page.execute_script "document.querySelector('#{what}').click()"
  end

  def list(what)
    expect(page).to have_css '#recordsListHeading'
    # click_on_selector('#showOnly .dropdown-toggle')

    # within '#showOnly .dropdown-menu' do
    #   find('.dropdown-item span', text: what, match: :prefer_exact).click
    # end

    # expect(page).not_to have_css '.loading-background' # oh. forgot about the wheel.
  end

  def list_today
    list 'Records that need to be solved today:'
  end

  def list_unsolved
    list 'All unsolved:'
  end

  def list_solved
    list 'All solved:'
  end

  def list_all
    list 'All:'
  end

  def sort_by(what)
    expect(page).to have_css '#sortBy'
    click_on_selector('#sortBy .dropdown-toggle')

    within '#sortBy .dropdown-menu' do
      click_on what
    end

    expect(page).not_to have_css '.loading-background' # oh. forgot about the wheel.
  end

  # def today_button
  #   ".btn-group-sm:nth-child(1) .btn-sm"
  # end

  # def unsolved_button
  #   ".btn-group-sm:nth-child(2) .btn-sm"
  # end

  # def solved_button
  #   ".btn-group-sm:nth-child(3) .btn-sm"
  # end

  # def all_button
  #   ".btn-group-sm:nth-child(4) .btn-sm"
  # end

  def expect_to_have_split_button(count=1)
    expect_to_have_button 'arrows-alt', '1', count
  end

  def expect_to_have_repeat_button(count=1)
    expect_to_have_button 'redo', '1', count
  end

  def expect_to_have_depends_button(count=1)
    expect_to_have_button 'exchange-alt', '1', count
  end

  def expect_to_have_solve_button(table=1, count=1)
    expect_to_have_button 'check', table, count
  end

  def expect_to_have_button(the_button, table, count)
    expect(page).to have_css ".semiTable:nth-of-type(#{table.to_s}) .btn [data-icon='#{the_button}']", count: count
  end

  def expect_not_to_have_split_button
    expect_not_to_have_button 'arrows-alt'
  end

  def expect_not_to_have_repeat_button
    expect_not_to_have_button 'redo'
  end

  def expect_not_to_have_depends_button
    expect_not_to_have_button 'exchange-alt'
  end

  def expect_not_to_have_solve_button
    expect_not_to_have_button 'check'
  end

  def expect_not_to_have_button(the_button)
    expect(page).not_to have_css ".semiTable:nth-of-type(1) .btn [data-icon='#{the_button}']"
    expect(page).not_to have_css ".semiTable:nth-of-type(2) .btn [data-icon='#{the_button}']"
  end

  def expect_content_within_comments(content, count: 1)
    within '#comments' do
      expect(page).to have_content(content, count: count)
    end
  end

  def expect_no_content_within_comments(content)
    within '#comments' do
      expect(page).to have_no_content(content)
    end
  end

  def submit_reply_for_comment(comment)
    within "#comment_#{comment.id} form" do
      click_on 'Reply'
    end
  end
end
