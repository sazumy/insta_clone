class PostsController < ApplicationController
  before_action :require_login, only: :new
  def index
    @users = User.all
    @posts = Post.all.order(created_at: 'DESC')
  end

  def new
    @post = PostForm.new(user_id: current_user.id)
  end

  def create
    @post = PostForm.new(post_params.merge(user_id: current_user.id))
    if @post.save!
      redirect_to root_path
      flash[:success] = "投稿しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private

  def post_params
    params.require(:post_form).permit(:body, photoes: [])
  end
end
