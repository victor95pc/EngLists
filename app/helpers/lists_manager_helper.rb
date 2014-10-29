module ListsManagerHelper
  def show_tasks_descriptions(tasks)
    content_tag(:ul) do
      tasks.each do |task|
        change = task.status ? 'Undone' : 'Done'
        concat tag(:li, id: 'task') <<
                   tag('input', value: task.description, class: 'task', id: task.id) <<
                   link_to('Delete', task_path(task.id), method: :delete, remote: true, class: 'delete', data: {confirm: 'Are you sure ?' }) <<
                   content_tag(:a, change, class: 'change', id: task.id, data: { status: !task.status })
      end
    end
  end

  def delete_list(list_id)
    link_to(image_tag('delete.png', alt:'delete', class: 'delete_icon'), list_path(list_id), method: :delete, remote: true, data: { confirm: 'Are you sure ?' }, class: 'delete_list')
  end
end