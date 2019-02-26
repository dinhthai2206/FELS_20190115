class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @pagy, @categories = pagy Category.includes(:words), item: 20
  end

  def show
    @category = Category.find_by id: params[:id]
    @pagy, @words = pagy @category.words.all_words, item: 30
  end
end
