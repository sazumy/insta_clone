# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  body         :text(65535)      not null
#  images_count :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
end
