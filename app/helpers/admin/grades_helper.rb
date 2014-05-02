module Admin::GradesHelper
  
  def grade_status
    ["open","close"]
  end
  
  def teachers_list
    User.teachers.pluck(:name,:id)
  end
  
end
