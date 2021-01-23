class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string

  def search
    inputs = params[:body]
    keywords = inputs.split(/[[:blank:]]+/)
    keywords.each do |keyword|
      @posts = Post.includes(:user, :images).where('body LIKE ?', "%#{keyword}%").page(params[:page])
    end
  end

end
