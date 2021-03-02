class PostForm
  include ActiveModel::Model

  attr_accessor :body, :photoes, :user

  validates :body, presence: true

  def initialize(user, params = {}, post: '')
    @post = Post.new
    @post.assign_attributes({ user: user, body: params[:body] })
    super(params)
  end

  def to_model
    @post
  end

  def save!
    return false if invalid?
    return false if photoes.nil?
    photoes.each do |photo|
      @post.images.build(photo: photo).save!
    end

    @post.save! ? true : false
  end
end
