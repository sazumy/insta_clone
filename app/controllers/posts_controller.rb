class PostsController < ApplicationController
  before_action :require_login, only: %i[new edit]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @users = User.all
    @posts = Post.includes(:user, :images).order(created_at: 'DESC').page(params[:page])
  end

  def new
    @post_form = PostForm.new(current_user)
  end

  def create
    @post_form = PostForm.new(current_user, post_params, post: Post.new)
    if @post_form.save!
      redirect_to root_path
      flash[:success] = '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show; end

  def edit
    @post_form = PostForm.new(current_user, post: @post)
  end

  def update
    @post_form = PostForm.new(current_user, post_params, post: @post)
    if @post_form.save!
      redirect_to root_path
      flash[:success] = '投稿を編集しました'
    else
      flash.now[:danger] = '投稿の編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path
    flash[:success] = '投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:body, photoes: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
