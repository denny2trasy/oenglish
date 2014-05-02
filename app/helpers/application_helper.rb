module ApplicationHelper
  
  def li_active controller_name, controller
		return ((controller_name == controller.class.to_s) ? "active" : "")
	end
  
end
