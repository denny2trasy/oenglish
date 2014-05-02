class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer   :teacher_id
      t.string    :name,  :status #open close
      t.string    :num_of_students
      t.date      :start_date
      t.integer   :start_hour, :start_minute, :duration
      t.integer   :repeat_wday
      t.text      :desc
      t.timestamps
    end
  end
end
