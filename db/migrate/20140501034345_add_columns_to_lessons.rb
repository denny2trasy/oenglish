class AddColumnsToLessons < ActiveRecord::Migration
  def up
    change_table :lessons do |t|
      t.string  :name, :url
      t.text   :script,  :desc
    end
  end
  def down
    change_table :lessons do |t|
      t.remove  :name, :url
      t.remove   :script,  :desc
    end
  end
end
