class Admin::SchedulesController < Admin::BaseController
  
  def index
    @q = Schedule.search(params[:q])
    @schedules = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @schedule = Schedule.new(schedule_params)
  end
  
  def create
    begin
      schedule = Schedule.create!(schedule_params)
      redirect_to meeting_admin_schedule_path(schedule)
    rescue Exception => e
      flash[:notice] = e.message
      redirect_to admin_schedules_path
    end    
  end
  
  # this is for create meeting in webex
  def meeting
    schedule = Schedule.find_by_id(params[:id])
    back_url = webex_admin_schedule_url(schedule)
    w_params = schedule.params_for_webex_create_meeting(back_url)
    redirect_to Webex::UrlApi.new.schedule_meeting(w_params)
  end
  
  # this is for receiving feedback from webex
  def webex
    webex_no = params[:MK]    
    if webex_no.present?      
      schedule = Schedule.find_by_id(params[:id])
      flash[:notice] = schedule.update_columns(:webex_no => webex_no) ? "Success" : "Update Fail"
    else
      flash[:notice] = "Fail to create webex, error message: #{params[:RS]} "
    end
    redirect_to admin_schedules_path
  end
  
  
  def edit
    @schedule = Schedule.find_by_id(params[:id])
  end
  
  def update
    user = Schedule.find_by_id(params[:id])
    begin
      user.update!(schedule_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_schedules_path
  end
  
  def destroy
    flash[:notice] = Schedule.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_schedules_path
  end
  

  private
  def schedule_params
    params.require(:schedule).permit(:title,:teacher_id,:grade_id,:start_at,:end_at,:webex_pwd)
  end
  
end
