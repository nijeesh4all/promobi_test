class Api::CourseController < ApplicationController
  include Pagination

  def index
    @courses = Course.all.includes(:tutors)
    @pagy, @courses = pagy(@courses)
    render json: @courses
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: { success: true, message: 'created' }, status: :created
    else
      render json: { success: false, message: 'could not create',
                     errors: @course.errors.full_messages }, status: :bad_request
    end
  end

  private

  def course_params
    params.require(:course)
          .permit(:name, tutors_attributes: [:name])
  end

end
