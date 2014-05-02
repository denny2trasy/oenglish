class Admin::AgentsController < Admin::BaseController
  
  def index
    @q = Agent.search(params[:q])
    @agents = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @agent = Agent.new
  end
  
  def create
    begin
      Agent.create!(agent_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_agents_path
  end
  
  def edit
    @agent = Agent.find_by_id(params[:id])
  end
  
  def update
    agent = Agent.find_by_id(params[:id])
    begin
      agent.update!(agent_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_agents_path
  end
  
  def destroy
    flash[:notice] = Agent.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_agents_path
  end
  
  def show
    @agent = Agent.find_by_id(params[:id])
  end
  
  
  private
  def agent_params
    params.require(:agent).permit(:user_id, :top_id,:name,:contract_no,:commission_x,  :commission_ya, :commission_yb,  :commission_z,:a_type,:logo)
  end
  
end
