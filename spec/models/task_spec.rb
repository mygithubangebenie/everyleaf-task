require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the name is empty" do
    task = Task.new(name: 'benie', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation pass if content is not empty" do
    task = Task.new(name: 'benie', content: 'Failure test', status:'completed', priority:'high', startdate:'2017-3-12', enddate:'2019-3-12')
    expect(task).to be_valid
    # Describe the contents here
  end

  it "validation passes If content is described in name and content" do
    # Describe the contents here
  end
end