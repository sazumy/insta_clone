class RelationshipsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
  end
end
