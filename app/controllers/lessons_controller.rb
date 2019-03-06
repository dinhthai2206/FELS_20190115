class LessonsController < ApplicationController
  load_and_authorize_resource param_method: :lesson_params

  def show

  end

  def create
    @lesson = current_user.lessons.build lesson_params
    if @lesson.save
      flash[:success] = t ".success"      
    else
      flash[:danger] = t ".failed"
    end
    redirect_to current_user
  end

  private

  def lesson_params
    params.require(:lesson).permit :category_id
  end
end
