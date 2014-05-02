class Student::CoursewaresController < Student::BaseController
  
  def index
    @q = Courseware.search(params[:q])
    @coursewares = @q.result(distinct: true).page(params[:page])
  end
  
end
