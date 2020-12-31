class PostForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  def initialize(params)
    super(params)
  end

  attr_accessor :body, :photo, :user_id
  mount_uploader :photo, ImageUploader

  validates :body, presence: true

  def save!
    return false if invalid?
    post = Post.new(body: body, user_id: user_id)
    post.images.build(photo: photo).save!

    post.save!
    return post
  end
end
