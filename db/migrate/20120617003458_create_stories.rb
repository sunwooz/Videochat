class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :primary_language_id
      t.integer :course_id
      t.string :name
      t.text :lesson
      t.timestamps
    end
  end
end
