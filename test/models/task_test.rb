require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create a new task' do
    assert Task.create!(
               description: 'Nice Task',
               status: false,
               list: lists(:software_list)
    )
  end
end
