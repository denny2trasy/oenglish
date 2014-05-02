module Admin::LessonsHelper
  
  def courses_list
    Course.all.pluck(:name,:id)
  end
  
end
