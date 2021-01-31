class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string
  attribute :user_name, :string
  attribute :comment_body, :string

  def search
    body_keywords = body.strip.split(/[[:blank:]]+/)

    @posts = Post.none

    body_keywords.each do |keyword|
      @posts = @posts.or(Post.includes(:user, :images).where('body LIKE ?', "%#{keyword}%")) if user_name.present?
    end

    @posts += Post.joins(:user).where('username LIKE ?', "%#{user_name}%") if user_name.present?
    @posts += Post.joins(:comment).where('body LIKE ?', "%#{comment_body}%") if comment_body.present?
    return Kaminari.paginate_array(@posts)
  end

end
