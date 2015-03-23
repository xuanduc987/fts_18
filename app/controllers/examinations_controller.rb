class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course
  before_action :correct_user, except: :create

  def create
    @examination = Examination.new course: @course, user: current_user
    @course.questions.shuffle.each do |question|
      @examination.answers.build question: question
    end
    unless @examination.save
      flash[:warning] = "You can't learn this."
      redirect_to root_url
    end
    redirect_to course_examination_path(@course, @examination)
  end

  def show
  end

  def update
  end

  private
  def load_course
    @course = Course.find_by id: params[:course_id]
  end

  def correct_user
    @examination = Examination.find_by id: params[:id]
    unless @examination.user == current_user
      flash[:warning] = "You can't view other's test"
      redirect_to root_url
    end
  end
end
