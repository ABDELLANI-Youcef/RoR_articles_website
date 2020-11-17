require 'rails_helper'

RSpec.describe 'User management', type: :feature do
  let(:user) { User.create(name: 'Youcef ABDELLANI') }
  scenario 'User signs up successfully' do
    visit root_path
    click_on 'Sign up'
    sleep(3)
    fill_in 'user[name]', with: 'Mohamed Abdellani'
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Welcome Mohamed Abdellani, you have successfully signed up.')
  end

  scenario 'User signs in successfully' do
    visit root_path
    click_on 'Log in'
    sleep(3)
    fill_in 'session[name]', with: user.name
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Logged in successfully.')
  end

  scenario 'User logs out successfully' do
    visit root_path
    click_on 'Log in'
    sleep(3)
    fill_in 'session[name]', with: user.name
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Logged in successfully.')
    click_on 'Log out'
    sleep(3)
    expect(page).to have_content('Logged out.')
  end
end
