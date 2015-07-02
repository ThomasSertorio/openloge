# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  service_id     :integer
#  status         :string
#  pricing_nature :string
#  starts_at      :datetime
#  duration       :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  loge_id        :integer
#
# Indexes
#
#  index_bookings_on_loge_id     (loge_id)
#  index_bookings_on_service_id  (service_id)
#  index_bookings_on_user_id     (user_id)
#

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  belongs_to :loge
  has_one   :review
  has_many   :messages

  validates :loge, presence: true
  validates :user, presence: true
  validates :service, presence: true

end
