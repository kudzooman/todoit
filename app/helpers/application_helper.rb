module ApplicationHelper
    def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping || Devise.mappings[:user]
  end

  def not_logged_in(&block)
  capture(&block) unless session[:user_id]
  end

  def logged_in(&block)
    capture(&block) if session[:user_id]
  end

  def todo_url_helper(todo)
    list = todo.list
    [list, todo]
  end

end
