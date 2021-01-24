class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string

  def search
    Post.includes(:user, :images).where('body LIKE ?', "%#{body}%")
  end

end
