module ApplicationHelper
  def active_tab controller
    return "active" if controller_name == controller
  end
end
