class LessonsController < ApplicationController
  load_and_authorize_resource param_method: :lesson_params
  before_action :find_lesson

  def show
    @choices = @lesson.choices.includes(word: [:answers])
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

  def edit
  end

  def update
    @lesson.status = "answered"
    @lesson.update_attributes(lesson_params)
    redirect_to @lesson
  end

  private

  def lesson_params
    params.require(:lesson).permit :category_id, :status,
      choices_attributes: [:id, :user_id, :word_id, :answer_id, :is_correct_answer]
  end

  def find_lesson
    @lesson = Lesson.find_by(id: params[:id])
  end
end
