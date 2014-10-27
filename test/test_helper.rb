ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'pry'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def crud_test_task(method, task)
    case method
      when :create  ; post :create, task: { description: task.description, list: task.list, status: task.status }
      when :update  ; patch :update, id: task, task: { description: task.description, list: task.list, status: false }
      when :destroy ; delete :destroy, id: task

      else raise Exception 'method not found'
    end
  end

  def crud_test_list(method, list)
    case method
      when :create  ; post :create, list: { name: list.name, user: list.user }
      when :update  ; patch :update, id: list, list: { name: list.name, user: list.user }
      when :destroy ; delete :destroy, id: list

      else raise Exception 'method not found'
    end
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end