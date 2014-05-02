class Course < ActiveRecord::Base
  has_many  :lessons
  default_scope {order(:position)}
end
