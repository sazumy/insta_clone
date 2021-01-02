class PostForm
  include ActiveModel::Model

  attr_accessor :body, :photoes, :user_id
  validates :body, presence: true

  def initialize(user, params = {}, post: Post.new)
    @post = post
    @post.assign_attributes({user: user, body: params[:body]})
    super(params)
  end

  def to_model
    @post
  end


  # TODO: UPDATEでもCREATEになってしまうのを直す
  # CREATEでうまくいくか確認する
  def save!
    return false if invalid?
    if photoes
      photoes.each do |photo|
        @post.images.build(photo: photo).save!
      end
    end

    @post.save! ? true : false
  end
end
