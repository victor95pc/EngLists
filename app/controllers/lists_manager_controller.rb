class ListsManagerController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = {done: {}, not_done: {}}

    @lists = List.get_lists(current_user)

    @lists.each do |list|
      @tasks[:done][list]     = list.tasks.select { |task| task     if task.status}
      @tasks[:not_done][list] = list.tasks.select { |task| task unless task.status}
    end
  end
end
