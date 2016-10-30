class CreateSections < ActiveRecord::Migration
  def up
      create_table :sections do |t|
       t.string :name, :limit => 25
       t.integer :position
       t.boolean :visible, default: false
       t.string :content_type, :limit => 30
       t.text :content
       #t.references :pages, index: true
      end
  end
  def down
  drop_table :sections do |t|
      end
  end
end
