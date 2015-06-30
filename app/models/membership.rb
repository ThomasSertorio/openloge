# == Schema Information
#
# Table name: memberships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  loge_id      :integer
#  member_since :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_memberships_on_loge_id  (loge_id)
#  index_memberships_on_user_id  (user_id)
#

class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :loge

  validates :loge, presence: true
  validates :user, presence: true
end
