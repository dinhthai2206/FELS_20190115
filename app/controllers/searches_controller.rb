class SearchesController < ApplicationController
  def index
    @pagy, @words = pagy Word.search(params[:query]).records.all_words, items: 30
    @learned_word_ids = current_user.learned_words.pluck(:id)
    respond_to do |format|
      format.html {render "words/index"}
    end
  end
end
