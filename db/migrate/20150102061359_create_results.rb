class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :trainee, index: true
      t.references :lesson, index: true
      t.references :course_subjects, index: true
      t.boolean :status_lesson

      t.timestamps
    end
  end
end
