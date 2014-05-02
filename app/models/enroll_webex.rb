class EnrollWebex < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
end
