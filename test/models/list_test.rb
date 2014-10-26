require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test 'create a new list' do
    assert List.create!(
               name: 'Good List',
               user: users(:victor)
    )
  end
end
