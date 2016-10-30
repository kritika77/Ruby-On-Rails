class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
        t.string :name, :limit => 25
        t.integer :position
        t.boolean :visible, default: false
    end
  end
  
  def down
  drop_table :subjects do |t|
      end
  end
end
