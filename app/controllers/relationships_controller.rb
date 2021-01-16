class RelationshipsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @follower = User.find(params[:follower])
    current_user.follow(follower: @follower)
  end

  def destroy
    current_user.unfollow(params[:id])
  end
end
