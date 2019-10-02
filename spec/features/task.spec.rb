require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
        background do
        # Create two tasks in advance to use in the task list test
    
        # The description of the background is in the category（feature "Task management function", type: :Inside from feature do to end）
        # Run within all processes present (in scenario)
        # (Even if "Test task list" or "Test whether tasks are arranged in descending order of creation date", the code in background is executed)
        
      end
  # In scenario (alias of it), write the processing of the test for each item you want to check.
    scenario "Test task list" do
    
        # Create two tasks in advance to use in the task list test
        Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
        Task.create!(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
      
        # visit to tasks_path (transition to task list page)
        visit tasks_path
      
        # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
        #save_and_open_page is placed immediately after visit tasks_path
        save_and_open_page

        expect(page).to have_content 'testtesttest'
        expect(page).to have_content 'samplesample'
    end

  scenario "Test task creation" do
      # visit to new_task_path (transition to task registration page)
      visit new_task_path
      # In the input field labeled "Task Name" and in the input field labeled "Task Details"
      # Fill in the task title and content respectively
      fill_in  'Name' ,  with: 'completed'
      fill_in  'Content' ,  with: 'ruby task'
      # Click_on a button with a value (notation letter) of “Register”
      click_on  '登録する'
      # Check if the information that is supposed to be registered by click is displayed on the task detail page
      # (Assumption that transition to the task details screen will be made if the task is registered)
      # expect(page ).to  have_text('Task was successfully created.')
  end

  scenario "Test task details" do
   @task = Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
   visit task_path(id: @task.id)
   expect(page).to have_content('test_task_01')
   expect(page).to have_content('testtesttest')
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Write test content 
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    Task.create!(name: 'test_task_02', content: 'testtesttest2', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    @task = Task.order('created_at ASC')
  end

  scenario "Test task updating" do
    task1=Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    visit edit_task_path(id: task1.id)
    fill_in 'Name', with: 'name update'
    fill_in 'Content', with: 'content update'
    click_on '更新する'
    visit tasks_path
    expect(page).to have_content('name update')
    expect(page).to have_content('content update')
  end
  scenario 'Test Task Deletion' do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'high',startdate: '10.2.2019', enddate: '20.10.2019')
    visit tasks_path
    expect(page).to have_content('testtesttest')
    click_on 'Destroy'
    expect(page).not_to have_content('testtesttest')
  end
  scenario "Test sort in high order by priority" do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: 'completed',priority: 'low', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.create!(name: 'test_task_02', content: 'samplesample', status: 'completed',priority: 'high', startdate: '10.2.2019', enddate: '20.10.2019')
    Task.order('priority asc')
  end
end


