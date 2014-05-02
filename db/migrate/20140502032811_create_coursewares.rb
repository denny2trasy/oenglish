class CreateCoursewares < ActiveRecord::Migration
  def change
    create_table :coursewares do |t|
      t.integer :position
      t.string  :name      
      t.text :desc
      t.attachment :ppt
      t.timestamps
    end
  end
end
