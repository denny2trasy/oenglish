class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer   :grade_id
      t.integer   :teacher_id
      t.string    :title
      t.datetime  :start_at,  :end_at
      t.string    :webex_no,  :webex_pwd
      t.timestamps
    end
  end
end
