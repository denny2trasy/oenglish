module Admin::SchedulesHelper
  
  def grades_list
    Grade.all.pluck(:name,:id)
  end
  
end
