class Suppervisor::CourseSubjectsController < ApplicationController
  def show
    @courses = Course.all
    if params[:commit]
      @course = Course.find params[:course_id]
      @course_subjects = @course.course_subjects
    end
  end

  def update
    @course_subject = CourseSubject.find params[:id]
    if params[:commit]
      CourseSubject.update(@course_subject.id, status_subjects: @course_subject.status_subjects + 1)
      redirect_to suppervisor_course_subject_path
    end
  end 
end
