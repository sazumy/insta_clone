# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_relationships_on_follower_id              (follower_id)
#  index_relationships_on_user_id                  (user_id)
#  index_relationships_on_user_id_and_follower_id  (user_id,follower_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#
class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'
  has_one :activity, as: :subject, dependent: :destroy

  validates :user_id, uniqueness: { scope: :follower_id }
end
