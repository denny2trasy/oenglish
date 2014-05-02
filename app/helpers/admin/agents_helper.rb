module Admin::AgentsHelper
  
  def agent_type
    ["person","school","intermedia","tutorial","training","visa_center"]
  end
  
  def user_agents_list
    User.agents.pluck(:name,:id)
  end
  
  def agents_list
    Agent.all.pluck(:name,:id)
  end
  
end
