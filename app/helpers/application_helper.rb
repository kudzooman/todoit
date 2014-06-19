module ApplicationHelper
    def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def todo_url_helper(todo)
    list = todo.list
    [list, todo]
  end

end
