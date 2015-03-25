class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @courses = Course.paginate page: params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Course created!"
      redirect_to admin_courses_path
    else
      render "new"
    end
  end

  def edit
    @course = Course.find_by id: params[:id]
  end

  def update
    @course = Course.find_by id: params[:id]
    if @course.update_attributes course_params
      flash[:success] = "Course updated"
      redirect_to admin_root_path
    else
      render "edit"
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to admin_root_path
  end

  private
  def course_params
    params.require(:course).permit :name, :description
  end
end
