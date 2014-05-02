class Admin::LessonsController < Admin::BaseController
  
  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result(distinct: true).page(params[:page])
  end
  
  def new
    @lesson = Lesson.new(lesson_params)
  end
  
  def create
    begin
      Lesson.create!(lesson_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_lessons_path
  end
  
  def edit
    @lesson = Lesson.find_by_id(params[:id])
  end
  
  def update
    user = Lesson.find_by_id(params[:id])
    begin
      user.update!(lesson_params)
      flash[:notice] = "Success"
    rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to admin_lessons_path
  end
  
  def destroy
    flash[:notice] = Lesson.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to admin_lessons_path
  end
  

  private
  def lesson_params
    params.require(:lesson).permit(:name,:course_id,:script,:url,:desc)
  end
  
end
