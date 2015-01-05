class Result < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :lesson
  belongs_to :course_subjects
end
