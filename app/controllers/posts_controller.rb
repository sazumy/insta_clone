class PostsController < ApplicationController
  before_action :require_login, only: %i(new edit)
  before_action :set_post, only: %i(show edit update delete)

  def index
    @users = User.all
    @posts = Post.all.order(created_at: 'DESC')
  end

  def new
    @post_form = PostForm.new(current_user)
  end

  def create
    @post_form = PostForm.new(current_user, post_params)
    if @post_form.save!
      redirect_to root_path
      flash[:success] = "投稿しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post = PostForm.new(post_edit_params.merge(user_id: current_user.id))
    if @post.save!
      redirect_to root_path
      flash[:success] = "投稿を編集しました"
    else
      flash.now[:danger] = "投稿の編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path
    flash[:success] = '投稿を削除しました'
  end

  private

  # TODO: post_paramsとpost_edit_paramsを統合する
  def post_params
    params.require(:post).permit(:body, photoes: [])
  end

  def post_edit_params
    params.require(:post).permit(:body, photoes: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
