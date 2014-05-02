class ChangeUTypeDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :u_type, :string,  :default => "student"
  end
end
