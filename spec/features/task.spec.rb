require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
    background do
        # Create two tasks in advance to use in the task list test
    
        # The description of the background is in the category（feature "Task management function", type: :Inside from feature do to end）
        # Run within all processes present (in scenario)
        # (Even if "Test task list" or "Test whether tasks are arranged in descending order of creation date", the code in background is executed)
        Task.create!(title: 'test_task_01', content: 'testtesttest')
        Task.create!(title: 'test_task_02', content: 'mofmofmofmof')
      end
  # In scenario (alias of it), write the processing of the test for each item you want to check.
    scenario "Test task list" do
    
        # Create two tasks in advance to use in the task list test
        Task.create!(title: 'test_task_01', content: 'testtesttest')
        Task.create!(title: 'test_task_02', content: 'samplesample')
      
        # visit to tasks_path (transition to task list page)
        visit tasks_path
      
        # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
        #save_and_open_page is placed immediately after visit tasks_path
        save_and_open_page

        expect(page).to have_content 'testtesttest'
        expect(page).to have_content 'samplesample'
      end

    end

  scenario "Test task creation" do

  end

  scenario "Test task details" do

  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    # Write test content here
  end
end

