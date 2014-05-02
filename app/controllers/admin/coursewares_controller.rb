class Admin::CoursewaresController < Admin::BaseController
  
  def index
    @q = Courseware.search(params[:q])
    @coursewares = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @courseware = Courseware.new
  end
  
  def create
    begin
      Courseware.create!(courseware_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_coursewares_path
  end
  
  def edit
    @courseware = Courseware.find_by_id(params[:id])
  end
  
  def update
    user = Courseware.find_by_id(params[:id])
    begin
      user.update!(courseware_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_coursewares_path
  end
  
  def destroy
    flash[:notice] = Courseware.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_coursewares_path
  end
  

  private
  def courseware_params
    params.require(:courseware).permit(:position,:name,:desc,:ppt)
  end
  
end
