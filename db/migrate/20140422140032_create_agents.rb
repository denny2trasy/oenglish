class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.integer :user_id, :top_id
      t.string  :contract_no
      t.decimal :commission_x,  :commission_ya, :commission_yb,  :commission_z, :precision => 8, :scale => 2
      t.string  :a_type
      t.boolean :logo,  :default => false
      t.timestamps
    end
  end
end
