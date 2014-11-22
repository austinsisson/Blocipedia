require 'spec_helper'

feature 'User creates wiki', %q{
  As a user
  I want a to be able to create a new wiki
  So I can track my interests
} do

  background do
    @user = User.new(email: 'test@user.com', password: 'password')
    @user.skip_confirmation!
    @user.save!
  end

  scenario 'User creates wiki' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'Add new wiki'
    puts page.html
    fill_in 'Name', with: 'First wiki'
    fill_in 'Content', with: 'Very excited to create my first wiki'
    click_button 'Create wiki'
    expect(page).to have_content('First wiki')
  end
end