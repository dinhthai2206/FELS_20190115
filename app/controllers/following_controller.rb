class FollowingController < ApplicationController
  def index
    @title = t ".following"
    @user  = User.find_by id: params[:user_id]
    @pagy, @users = pagy @user.following, items: 20
    render "users/show_follow"
  end
end
