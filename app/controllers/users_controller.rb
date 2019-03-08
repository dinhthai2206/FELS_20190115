class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @pagy, @users = pagy User.all, items: 30
  end

  def show
    @user = User.find_by id: params[:id]
    @lesson = @user.lessons.build
    @pagy, @lessons = pagy @user.lessons.order_created_desc.includes(:category),
      items: 10
  end
end
