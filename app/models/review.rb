# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  booking_id     :integer
#  description    :text
#  recommendation :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_reviews_on_booking_id  (booking_id)
#

class Review < ActiveRecord::Base
  belongs_to :booking

  validates :booking, presence: true


end
