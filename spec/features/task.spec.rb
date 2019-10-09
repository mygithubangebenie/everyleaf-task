require 'rails_helper'


RSpec.feature "Task management function", type: :feature do
  background do
    User.create!(name: "dusabe", email: 'dusabe@gmail.Com', usertype: 'admin',  password: '123456')
    visit  login_path
    #click_on 'Login'
    fill_in  'email' ,  with: 'dusabe@gmail.Com'
    fill_in  'password' ,  with: '123456'
    click_on  'Submit'
      end
 
    scenario "Test task list" do
      Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
      Task.create(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'low', startdate: '10.2.2019', enddate: '20.10.2019')
        visit tasks_path
      
        
        # save_and_open_page
    end

  scenario "Test task creation" do
      
      visit new_task_path
      
      fill_in  'Name' ,  with: 'completed'
      fill_in  'Content' ,  with: 'ruby task'
      
      click_on  '登録する'
      
      # expect(page ).to  have_text('Task was successfully created.')
  end

  scenario "Test task details" do
   click_on 'New Task'
   fill_in 'Name', with: 'name details'
    fill_in 'Content', with: 'content details'
    click_on '登録する'
    visit tasks_path
    Task.last

  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    Task.create(name: 'test_task_02', content: 'testtesttest2', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    @task = Task.order('created_at ASC')
  end

  scenario "Test task updating" do
    visit tasks_path
    @task=Task.last
    #visit edit_task_path
    #fill_in 'name', with: 'name '
    #fill_in 'content', with: 'content update'
    #click_on '更新する'
    visit tasks_path
    #expect(page).to have_content('name update')
    #expect(page).to have_content('content update')
  end
  scenario 'Test Task Deletion' do
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    visit tasks_path
    #expect(page).to have_content('testtesttest')
    #click_on 'Destroy'
    expect(page).not_to have_content('testtesttest')
  end
  scenario "Test sort in high order by priority" do
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'low', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.create(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.order('priority asc')
  end
end


