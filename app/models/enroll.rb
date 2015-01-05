class Enroll < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :course
end
