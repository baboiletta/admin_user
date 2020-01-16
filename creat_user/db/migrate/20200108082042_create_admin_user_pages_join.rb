class CreateAdminUserPagesJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users_pages do|t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
  end

end
