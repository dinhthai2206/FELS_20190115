class CategoriesController < ApplicationController
  load_and_authorize_resource

  layout "categories"

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    @category = Category.find_by id: params[:id]
    @pagy, @words = pagy @category.words.all_words, item: 30
    respond_to do |format|
      format.html
    end
  end
end
