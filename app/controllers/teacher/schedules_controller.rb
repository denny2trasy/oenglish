class Teacher::SchedulesController < Teacher::BaseController
  
  def index
    h = {:teacher_id_eq => current_user.id}
    @num = params[:num]
    unless @num.blank?
      d = Time.now.to_date
      date = d + @num.to_i.days
      h[:start_at_gteq] = date.beginning_of_day
      h[:start_at_lteq] = date.end_of_day
    end
    @q = Schedule.search((params[:q] || {}).merge(h))
    @schedules = @q.result(distinct: true).page(params[:page])
  end
  
  # start meeting
  def show
    schedule = Schedule.find_by_id(params[:id])
    wx = Webex::UrlApi.new
    back_url = teacher_schedules_url
    redirect_to wx.login(wx.start_meeting(schedule.webex_no, back_url))
  end
  
end
