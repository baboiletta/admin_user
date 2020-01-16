class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.integer "users_id"
      t.string "first_name"
      t.string "last_name"
      t.string "user_name"
  
    end
    add_index("admin_users", "first_name")
    add_index("admin_users", "user_name")
  end



end
