module ApplicationHelper
  def navigation_link_class(path)
    current_page?(path) ? "nav-link active" : "nav-link"
  end
end