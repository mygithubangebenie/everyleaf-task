require 'rails_helper'


RSpec.feature "Task management function", type: :feature do
  background do
    User.create!(name: "dusabe", email: 'dusabe@gmail.Com', usertype: 'admin',  password: '123456')
    visit  login_path
   
    fill_in  'email' ,  with: 'dusabe@gmail.Com'
    fill_in  'password' ,  with: '123456'
    click_on  'Submit'
    visit new_task_path
      
      fill_in  'Name' ,  with: 'completed'
      fill_in  'Content' ,  with: 'ruby task'
      
      click_on  '登録する' 
      end
 
    scenario "Test task list" do
      Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
      Task.create(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'low', startdate: '10.2.2019', enddate: '20.10.2019')
        visit tasks_path
      
        
        
    end

  scenario "Test task creation" do
      
      visit new_task_path
      
      fill_in  'Name' ,  with: 'completed'
      fill_in  'Content' ,  with: 'ruby task'
      
      click_on  '登録する'
      
      
  end

  scenario "Test task details" do

   visit new_task_path
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
    
    visit tasks_path
    
  end
  scenario 'Test Task Deletion' do
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    visit tasks_path
    
    expect(page).not_to have_content('testtesttest')
  end
  scenario "Test sort in high order by priority" do
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'low', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.create(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.order('priority asc')
  end
  scenario 'test task Search' do
    
    visit tasks_path
    @task=Task.last
    visit tasks_path
  end
  scenario "test task search by attached labels" do
   visit tasks_path

   visit new_task_path
   fill_in  'Name' ,  with: 'completed'
   fill_in  'Content' ,  with: 'ruby task'
   fill_in  'Status' ,  with: 'task status'
   click_on  '登録する'

    click_on 'Labels'
    click_on 'New Label'
    fill_in 'Name', with: 'label Name1'
    fill_in 'Content', with: 'label content1'
    click_on '登録する'

    click_on 'Labels'
    click_on 'New Label'
    fill_in 'Name', with: 'label Name1'
    fill_in 'Content', with: 'label content1'
    click_on '登録する'
    Task.create(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
   
    
    @task = Task.first
    @label1 = Label.first
    @label2 = Label.last
    @task.labels = [@label1,@label2]
    @task.save
    visit tasks_path
    fill_in  'term1' ,  with: 'label Name1'
    click_on '  Search'
    expect(page).to have_content('ruby task')
  end
end


