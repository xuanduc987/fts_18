class StaticPagesController < ApplicationController
  def home
    return unless current_user
    @examinations = current_user.examinations.paginate(page: params[:page],
                                                       per_page: 10)
  end

  def help
  end
end
