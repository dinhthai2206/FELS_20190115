class WordsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @pagy, @words = pagy Word.all_words, items: 30
  end

end
