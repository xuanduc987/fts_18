class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course
  before_action :correct_user, except: :create
  before_action :check_time_limit, only: :update

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
    flash[:success] = if @examination.update_attributes examination_params
                        "Your answers had been saved."
                      else
                        "Can't save your answers."
                      end
    redirect_to course_examination_path @course, @examination
  end

  private
  def load_course
    @course = Course.find_by id: params[:course_id]
  end

  def correct_user
    @examination = Examination.find_by id: params[:id]
    return if @examination.user == current_user
    flash[:warning] = "You can't view other's test"
    redirect_to root_url
  end

  def examination_params
    params.require(:examination).permit answers_attributes: [:id, :option_id,
                                                             :content]
  end

  def check_time_limit
    return unless @examination.time_up?
    flash[:warning] = "Time's up"
    redirect_to course_examination_path @course, @examination
  end
end
