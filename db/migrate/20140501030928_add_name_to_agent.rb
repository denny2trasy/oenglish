class AddNameToAgent < ActiveRecord::Migration
  def up
    change_table :agents do |t|
      t.string :name
    end
  end
  def down
    change_table :agents do |t|
      t.remove :name
    end    
  end
end
