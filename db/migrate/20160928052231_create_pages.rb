class CreatePages < ActiveRecord::Migration
    def up
        create_table :pages do |t|
           t.string :name, :limit => 25
           t.integer :position
           t.boolean :visible, default: false
           t.string :permalink, :limit => 80
          # t.references :subjects
         end
    end
    
    def down
        drop_table :pages do |t|
        end
    end
end
