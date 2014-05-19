class Schedule < ActiveRecord::Base
  belongs_to :grade
  belongs_to :teacher,  :class_name => User,  :foreign_key => :teacher_id
  
  def self.generate_pwd
    range = ("A".."Z").to_a + ("0".."9").to_a
    pwd = ""
    (1..8).each do |n|
      pwd += range[rand * range.size]
    end
    return pwd
  end
  
  def params_for_webex_create_meeting(back_url)
    params = {}
    params[:EN] = self.title
    params[:JPW] = self.webex_pwd
    params[:YE] = self.start_at.year
    params[:MO] = self.start_at.month
    params[:DA] = self.start_at.day
    params[:HO] = self.start_at.hour
    params[:MI] = self.start_at.min
    params[:DU] = (self.end_at - self.start_at).to_i/60
    params[:BU] = back_url
    params
  end
  
  def is_active
    t = Time.zone.now
    return ((self.start_at - 15.minutes) <= t and t <= self.end_at)
  end
  
end
