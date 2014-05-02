class AddGradesUsersTable < ActiveRecord::Migration
  def change
    create_table :grades_users do |t|
      t.integer   :grade_id, :user_id
      t.date  :deadline
      t.timestamps
    end
  end
end
