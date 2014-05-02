class Agent::StudentsController < Agent::BaseController
  
  def index
    unless current_agent.blank?
      @q = User.search((params[:q] || {}).merge({:agent_id_eq => current_agent.id}))
      @students = @q.result(distinct: true).page(params[:page])
    else
      flash[:notice] = "This account donot bind with agent!"
    end
  end
  
end
