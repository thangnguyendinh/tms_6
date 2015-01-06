class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :content
      t.references :subject, index: true

      t.timestamps
    end
  end
end
