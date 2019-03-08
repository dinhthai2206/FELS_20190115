class FollowersController < ApplicationController
  def index
    @title = t ".followers"
    @user  = User.find_by id: params[:user_id]
    @pagy, @users = pagy @user.followers, items: 20
    render "users/show_follow"
  end
end
