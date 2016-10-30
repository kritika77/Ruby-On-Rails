class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :firstname, :limit => 25
      t.string :lastname, :limit => 50
      t.string :username, :limit => 50
      t.string :email, :null => false
      t.string :password, :limit =>40
      t.timestamps
      end
     end
   def down
      drop_table :admin_users do |t|
      end
    end
end