# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background do
    User.create!(name: "dusabe", email: 'dusabe@gmail.Com', usertype: 'admin',  password: '123456')
    visit  login_path
   
    fill_in  'email' ,  with: 'dusabe@gmail.Com'
    fill_in  'password' ,  with: '123456'
    click_on  'Submit'
      end
  
  scenario "Test user list" do
    
    
    visit users_path
    expect(page).to have_content 'dusabe'

  end

  scenario "Test user creation" do
   
    visit users_path
    expect(page ).to  have_content  'dusabe'
  end

  scenario "Test user details" do
    @user= User.create!(name: 'dusabe', email: 'dusabe@gmail.com', usertype: 'admin', password: '123456')
    visit user_path(id: @user.id)
    expect(page).to have_content('dusabe@gmail.com')
    expect(page).to have_content('admin')
  end
  scenario "Test task updating" do
    @user = User.first
    visit edit_user_path(id: @user.id)
    fill_in 'Name', with: 'name update'
    
    click_on '更新する'
    visit users_path
  end
  scenario 'Test Task Deletion' do
    User.create!(name: 'benie', email: 'benie@gmail.com', usertype: 'admin', password: '123456')
    @user = User.last
    @user.destroy
    
    visit users_path
  end
end