class CreateUsersAndGradesJoinTable < ActiveRecord::Migration
  def change
    create_table :users_grades do |t|
      t.integer :user_id
      t.integer :grade_id
      t.date    :start_date, :end_date
      t.integer :num_of_class
    end
  end
end
