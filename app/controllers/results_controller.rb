class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course
  before_action :correct_user, except: :create

  def create
    @result = Result.new course: @course, user: current_user
    @course.questions.shuffle.each do |question|
      @result.answers.build question: question
    end
    unless @result.save
      flash[:warning] = "You can't learn this."
      redirect_to root_url
    end
    redirect_to course_result_path(@course, @result)
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
    @result = Result.find_by id: params[:id]
    unless @result.user == current_user
      flash[:warning] = "You can't view other's test"
      redirect_to root_url
    end
  end
end
