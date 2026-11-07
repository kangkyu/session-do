require 'rails_helper'

describe "adding a task", type: :feature do
  include ActiveSupport::Testing::TimeHelpers

  let!(:user) { User.create!(user_attributes) }

  before :each do
    visit '/login'
    within("#session") do
      fill_in 'email', with: user.email
      fill_in 'password', with: user_attributes[:password]
    end
    click_button 'Log In'
  end

  it "adds a task from the task list" do
    visit '/'
    expect(page).to have_content "You don't have any task to do."

    click_link 'Add Task'
    expect(page).to have_current_path(new_task_path)

    fill_in 'task_name', with: 'Water the plants'
    fill_in 'task_comment', with: 'balcony too'

    expect {
      click_button 'Add'
    }.to change { user.tasks.count }.by(1)

    expect(page).to have_current_path(tasks_path)
    expect(page).to have_content 'Task Added!'
    expect(page).to have_content 'Water the plants'
    expect(page).to have_content 'balcony too'

    task = user.tasks.last
    expect(task.name).to eq 'Water the plants'
    expect(task.is_daily).to be false
    expect(task.done_at).to be_present
  end

  it "adds a daily task scheduled a day ahead" do
    visit new_task_path
    fill_in 'task_name', with: 'Stretch'
    check "Let's do it everyday!"

    freeze_time do
      click_button 'Add'
      task = user.tasks.last
      expect(task.is_daily).to be true
      expect(task.done_at).to be_within(1.second).of(1.day.from_now)
    end

    expect(page).to have_content 'Task Added!'
  end

  it "adds a task to do some days later" do
    visit new_task_path
    fill_in 'task_name', with: 'Call grandma'
    fill_in 'task_later', with: '3'

    freeze_time do
      click_button 'Add'
      expect(user.tasks.last.done_at).to be_within(1.second).of(3.days.from_now)
    end

    expect(page).to have_content 'Task Added!'
  end

  it "re-renders the form when name is missing" do
    visit new_task_path
    fill_in 'task_comment', with: 'no name here'

    expect {
      click_button 'Add'
    }.not_to change { Task.count }

    expect(page).to have_content 'Please try again!'
    expect(page).to have_button 'Add'
    expect(page).to have_field 'task_comment', with: 'no name here'
  end

  it "redirects to login when not signed in" do
    Capybara.reset_sessions!
    visit new_task_path
    expect(page).to have_content 'Please log in or sign up'
  end
end
