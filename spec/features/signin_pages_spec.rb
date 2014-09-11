require 'rails_helper'

describe "the login process" do

  it "logs a user in who uses the right password" do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content 'Photo Share World'
  end

  it "will not log in user with incorrect password" do
    visit '/login'
    user= User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'notpassword'
    click_button 'Log In'
    expect(page).to have_content 'invalid'
  end

  it "will successfully allow a user to sign up" do
    visit '/signup'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'Photo'
  end

  it "will not allow a user to sign up" do
    visit '/signup'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: ''
    click_button 'Sign Up'
    expect(page).to have_content 'invalid'
  end
end
