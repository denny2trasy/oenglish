class Student::CoursesController < Student::BaseController
  
  def index
    @q = Course.search(params[:q])
    @courses = @q.result(distinct: true).page(params[:page])
  end
  
  def show
    @lesson = Lesson.find_by_id(params[:id])
  end
  
end
