class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.boolean :status_course
      t.boolean :finished_course

      t.timestamps
    end
  end
end
