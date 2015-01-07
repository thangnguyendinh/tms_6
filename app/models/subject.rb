class Subject < ActiveRecord::Base
  belongs_to :course, through: :course_subjects
  has_many :course_subjects, dependent: :destroy
end