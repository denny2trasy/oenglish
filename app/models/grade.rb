class Grade < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :schedules
  has_many :grades_users
  belongs_to :teacher,  :class_name => User,  :foreign_key => :teacher_id
  
  scope :opened, -> {where(status: :open)}
end
