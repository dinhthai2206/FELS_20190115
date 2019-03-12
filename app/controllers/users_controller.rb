class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find_by id: params[:id]
    @lesson = @user.lessons.build
    @pagy, @lessons = pagy @user.lessons.order_created_desc.includes(:category),
      items: 10
  end
end
