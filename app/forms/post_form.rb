class PostForm
  include ActiveModel::Model

  def initialize(params)
    super(params)
    # binding.pry
  end

  attr_accessor :body, :image, :user_id
  validates :body, presence: true

  def save!
    return false if invalid?
    post = Post.new(body: body, user_id: user_id)
    post.images.build(image: image)

    post.save!

    return post
  end
end
