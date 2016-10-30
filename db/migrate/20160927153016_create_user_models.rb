class CreateUserModels < ActiveRecord::Migration
  def up
     create_table :user_models do |t|
      t.column "firstname", :string, :limit => 25
      t.string  "lastname", :limit => 50
      t.string  "email", :default => "", :null => false
      t.string  "password", :limit => 40
      # t.datetime :created_at, null: false
      # t.datetime :updated_at, null: false
      t.timestamps
      end
    end

    def down
       drop_table :user_models
       end
    end
end
