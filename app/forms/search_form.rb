class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string

  def search
    keywords = body.split(/[[:blank:]]+/)

    @posts = Post.none

    keywords.each do |keyword|
      @posts = @posts.or(Post.includes(:user, :images).where('body LIKE ?', "%#{keyword}%"))
    end

    return @posts
  end

end
