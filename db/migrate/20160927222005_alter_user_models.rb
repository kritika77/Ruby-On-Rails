class AlterUserModels < ActiveRecord::Migration
  def up
      rename table("user_models" , "admin_users")
      add_column("admin_users", "username", :string, :limit => 25)
      change_column("admin_users", "email", :string, :limit => 100)
      rename_column("admin_users", "password", "hashed_password", :string, :limit => 50)
      puts "*** Adding an index is next ***"
      add_index("admin_users", "username")
  end
  
  def down
      remove_index("admin_users", "username")
      rename_column("admin_users", "hashed_password", "password", :string, :limit => 40)
      change_column("admin_users", "email", :string, :default => false)
      remove_column("admin_users", "username")
      rename_table("admin_users", "users")
  end

end
