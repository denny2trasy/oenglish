class Agent < ActiveRecord::Base
  belongs_to :user
  has_many  :students,  :class_name => User
  
  def top_agent
    Agent.find_by_top_id(self.top_id)
  end
  
end
