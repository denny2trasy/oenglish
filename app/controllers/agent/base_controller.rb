class Agent::BaseController < ApplicationController
  layout "agent"
  before_action :authenticate_user!
  before_filter :check_agent?
  helper_method :current_agent
  
  def check_agent?
    redirect_to root_path unless current_user.is_agent?
  end
  
  def current_agent
    Agent.where({user_id: current_user.id}).first
  end
  
end