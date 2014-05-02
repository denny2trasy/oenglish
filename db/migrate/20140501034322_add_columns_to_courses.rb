class AddColumnsToCourses < ActiveRecord::Migration
  def up
    change_table :courses do |t|
      t.integer :position
      t.string :name
      t.text  :desc
    end
  end
  def down
    change_table :courses do |t|
      t.remove :position
      t.remove :name
      t.remove  :desc
    end    
  end
end
