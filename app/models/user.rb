class User < ActiveRecord::Base
  has_one :agent
  has_and_belongs_to_many :grades
  has_many  :grades_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :agents, -> {where(u_type: :agent)}
  scope :students, -> {where(u_type: :student)}
  scope :teachers, -> {where(u_type: :teacher)}
  scope :admins, -> {where(u_type: :admin)}   
  
  after_create :create_agent
  
  def create_agent
    if self.u_type == "agent"
      Agent.create(:user_id => self.id, :name => self.name)
    end
  end    
  
  def is_admin?
    return self.u_type == "admin"
  end
  
  def is_student?
    return self.u_type == "student"
  end
  
  def is_teacher?
    return self.u_type == "teacher"
  end
  
  def is_agent?
    return self.u_type == "agent"
  end
  
  def asigned_grades
    case self.u_type
    when "student"
      self.grades
    when "teacher"
      Grade.where(:teacher_id => self.id)
    else
      nil
    end
  end
  
  def enroll_meeting_params(schedule)
    params = {}
    params["AE"] = self.email
    params["FN"] = self.name || "fname"
    params["LN"] = self.login || "lname"
    params["MK"] = schedule.webex_no
    params
  end
  
  def join_enrolled_meeting_params(schedule)
    params = {}
    ew = EnrollWebex.where(:user_id => self.id, :schedule_id => schedule.id).first
    params["EI"] = ew.enroll_id
    params["MK"] = schedule.webex_no
    params["JPW"] = schedule.webex_pwd
    params
  end
  
  def enroll_meeting?(schedule)
    ew = EnrollWebex.where(:user_id => self.id, :schedule_id => schedule.id)
    return (ew.blank? ? false : true) 
  end
  
  def to_agent
    Agent.find_by_id(self.agent_id)
  end
         
end
