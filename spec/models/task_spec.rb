require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the name is empty" do
    task = Task.new(name: '', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation pass if content is not empty" do
    task = Task.new(name: 'benie', content: '')
    expect(task).not_to be_valid
  end

  it "validation does not pass If  name and content are empty" do
    task = Task.new(name: '', content: 'Failure test')
    expect(task).not_to be_valid
  end
end