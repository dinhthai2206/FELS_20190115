module Api
  class CategoriesController < ApplicationController
    load_and_authorize_resource

    def index
      @pagy, @categories = pagy Category.includes(:words), item: 20
      respond_to do |format|
        format.json
      end
    end

    def show
      @category = Category.find_by id: params[:id]
      @pagy, @words = pagy @category.words.all_words, item: 30
      respond_to do |format|
        format.json
      end
    end
  end
end
