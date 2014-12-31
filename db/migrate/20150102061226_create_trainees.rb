class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.string :name
      t.string :email
      t.references :user, index: true

      t.timestamps
    end
  end
end
