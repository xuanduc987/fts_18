class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = @courses.paginate page: params[:id]
  end

  def new
  end

  def create
    if @course.save
      flash[:success] = "Course created!"
      redirect_to admin_courses_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = "Course updated"
      redirect_to admin_root_path
    else
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to admin_root_path
  end

  private
  def course_params
    params.require(:course).permit :name, :description
  end
end
