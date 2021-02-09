class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string
  attribute :user_name, :string
  attribute :comment_body, :string

  def search
    scope = Post.includes(:user, :images)
    scope = splited_bodies.map { |splited_body| scope.body_contain(splited_body) }.inject { |result, scp| result.or(scp) } if body.present?
    scope = scope.comment_body_contain(body) if comment_body.present?
    scope = scope.username_contain(user_name) if user_name.present?
    scope
  end

  private

  def splited_bodies
    body.strip.split(/[[:blank:]]+/)
  end
end
