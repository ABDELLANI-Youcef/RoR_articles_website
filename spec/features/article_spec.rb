require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  let(:category1) { Category.create(name: "Technology", priority: 0)}
  let(:category2) { Category.create(name: "Books", priority: 1)}
  let(:category3) { Category.create(name: "History", priority: 2)}
  let(:category4) { Category.create(name: "News", priority: 3)}
  let(:user) { User.create(name: 'Youcef ABDELLANI') }
  scenario 'User writes article successfully' do
    category1.save
    category2.save
    category3.save
    category4.save
    visit root_path
    click_on 'Log in'
    sleep(3)
    fill_in 'session[name]', with: user.name
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Logged in successfully.')
    click_on 'Write an Article'
    sleep(3)
    expect(page).to have_content('Write a new article')
    find(:css, "#category-option-#{category1.id}[value='#{category1.id}']").set(true)
    find(:css, ".form-group h2").set(true)
    fill_in 'article_title', with: 'Youcef article'
    fill_in 'article_text', with: 'This is an article for the test'
    click_on 'Create Article'
    sleep(3)
    expect(page).to have_content('The article Youcef article has been successfully created.')
  end

  scenario 'User gets articles made successfully' do
    category1.save
    category2.save
    category3.save
    category4.save
    visit root_path
    click_on 'Log in'
    sleep(3)
    fill_in 'session[name]', with: user.name
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Logged in successfully.')
    click_on 'Write an Article'
    sleep(3)
    expect(page).to have_content('Write a new article')
    find(:css, "#category-option-#{category1.id}[value='#{category1.id}']").set(true)
    fill_in 'article_title', with: 'Youcef article'
    fill_in 'article_text', with: 'This is an article for the test'
    click_on 'Create Article'
    sleep(3)
    expect(page).to have_content('The article Youcef article has been successfully created.')
    click_on 'Youcef ABDELLANI'
    sleep(3)
    expect(page).to have_content('Youcef article')
  end

  scenario 'User edits articles made successfully' do
    category1.save
    category2.save
    category3.save
    category4.save
    visit root_path
    click_on 'Log in'
    sleep(3)
    fill_in 'session[name]', with: user.name
    click_on 'submit'
    sleep(3)
    expect(page).to have_content('Logged in successfully.')
    click_on 'Write an Article'
    sleep(3)
    expect(page).to have_content('Write a new article')
    find(:css, "#category-option-#{category1.id}[value='#{category1.id}']").set(true)
    fill_in 'article_title', with: 'Youcef article'
    fill_in 'article_text', with: 'This is an article for the test'
    click_on 'Create Article'
    sleep(3)
    expect(page).to have_content('The article Youcef article has been successfully created.')
    click_on 'Youcef ABDELLANI'
    sleep(3)
    expect(page).to have_content('Youcef article')
    click_on 'edit-0'
    sleep(3)
    expect(page).to have_content('Edit the article')
    fill_in 'article_title', with: 'Youcef First article'
    click_on 'Update Article'
    sleep(3)
    expect(page).to have_content('Article was successfully updated')
  end
end
