class WordsController < ApplicationController
  load_and_authorize_resource
  before_action :find_word
  include WordsHelper

  def index
    @pagy, @words = pagy Word.all_words.
      order(sort_column.to_s + " " + sort_direction), items: 30
    @learned_word_ids = current_user.learned_words.pluck(:id)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t ".success"
      redirect_to words_path
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t ".success"
      redirect_to words_path
    else
      flash[:danger] = t ".fail"
      render :edit
    end
  end

  private
  def find_word
    @word = Word.find_by id: params[:id]
  end

  def word_params
    params.require(:word).permit :category_id, :content,
      answers_attributes: [:id, :word_id, :content, :correct, :_destroy]
  end
end
