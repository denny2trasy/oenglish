class AddSomeFieldToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.integer   :agent_id
      t.string    :u_type # student teacher admin agent
      t.string    :login, :name,  :qq,  :weixin
      t.string    :mobile,  :parent_mobile
    end
  end
  def down
    change_table :users do |t|
      t.remove   :agent_id
      t.remove    :u_type # student teacher admin agent
      t.remove    :login, :name,  :qq,  :weixin
      t.remove    :mobile,  :parent_mobile
    end
  end
end
