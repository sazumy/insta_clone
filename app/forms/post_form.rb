class PostForm
  include ActiveModel::Model

  def initialize(params)
    super(params)
  end

  attr_accessor :body, :photoes, :user_id

  validates :body, presence: true

  def save!
    return false if invalid?
    post = Post.new(body: body, user_id: user_id)

    if photoes
      photoes.each do |photo|
        post.images.build(photo: photo).save!
      end
    end

    post.save! ? true : false
  end
end
