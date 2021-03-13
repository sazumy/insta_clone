class RelationshipsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @other_user = User.find(params[:follower])
    UserMailer.with(user_from: current_user, user_to: @other_user).follow.deliver_later if current_user.follow(@other_user)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
  end
end
