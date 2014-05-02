class CreateEnrollWebexes < ActiveRecord::Migration
  def change
    create_table :enroll_webexes do |t|
      t.integer :user_id, :schedule_id, :enroll_id
      t.timestamps
    end
  end
end
