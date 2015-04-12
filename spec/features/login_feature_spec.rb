require 'rails_helper'

describe "the login process", :type => :feature do
  before :each do
    User.create!(:email => 'user@example.com', :password => 'password', username: 'user')
  end

  it "signs me in" do
    visit '/login'
    within("#session") do
      fill_in 'email', :with => 'user@example.com'
      fill_in 'password', :with => 'password'
    end
    click_button 'Log In'
    expect(page).to have_content 'Login successful'

    visit '/'
    expect(page).to have_content 'Log Out'

    visit '/login'
    expect(page).to_not have_content 'Log In'
  end

  it "opens login page if before login" do
    visit '/'
    expect(page).to_not have_content 'First time?'
    expect(page).to have_content 'Log In'

  end
end
