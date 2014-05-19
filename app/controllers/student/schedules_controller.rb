class Student::SchedulesController < Student::BaseController
  
  def index
    grades_id = current_user.grades.opened.pluck(:id)
    if grades_id.blank?
      @schedules = []
    else
      h = {:grade_id_in => grades_id}
      unless params[:num].blank?
        @num = params[:num]
        d = Time.now.to_date
        date = d + @num.to_i.days
        h[:start_at_gteq] = date.beginning_of_day
        h[:start_at_lteq] = date.end_of_day
      else
        h[:start_at_lt] = Time.now.beginning_of_day  
      end
      @q = Schedule.search((params[:q] || {}).merge(h))
      @schedules = @q.result(distinct: true).page(params[:page])
    end
  end
  
  # enroll meeting and join meeting
  def show
    meeting = Schedule.find_by_id(params[:id])
    wx = Webex::UrlApi.new
    if current_user.enroll_meeting?(meeting)
      j_params = current_user.join_enrolled_meeting_params(meeting)
      back_url = oenglish_url(student_schedules_path)
      redirect_to wx.join_enrolled_meeting(j_params,back_url)
    else
      back_url = oenglish_url(enroll_student_schedules_path(:SID => meeting.id,:WID => meeting.webex_no,:PWD => meeting.webex_pwd))
      e_params = current_user.enroll_meeting_params(meeting)
      redirect_to wx.enroll_meeting(e_params,back_url)
    end
  end
  
  # enroll meeting
  def enroll
    begin
      EnrollWebex.create!({:enroll_id => params[:EI], :user_id => current_user.id, :schedule_id => params[:SID]})
      wx = Webex::UrlApi.new
      meeting = Schedule.find_by_id(params[:SID])
      j_params = current_user.join_enrolled_meeting_params(meeting)
      back_url = oenglish_url(student_schedules_path)
      redirect_to wx.join_enrolled_meeting(j_params,back_url)
    rescue Exception => e
      flash[:notice] = "You enrolled webex fail! error message : #{e.message}"
      redirect_to student_schedules_path
    end
  end
  
end
